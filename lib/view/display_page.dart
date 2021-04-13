import 'package:practice_arch/model/product.dart';
import 'package:practice_arch/providers/app_provider.dart';
import 'package:practice_arch/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import 'add_entry_page.dart';

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {

  @override
  void initState() {
    super.initState();
    initDb();
  }

  void initDb(){
    Provider.of<AppViewModel>(context,listen: false).init();
  }

  int _l;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Display'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: StreamBuilder(
                  stream: model.watchProducts(),
                  builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                    final products = snapshot.data?.toList() ?? [];
                    if (products.isEmpty) {
                      return Center(child: Text('No Data !!!'));
                    }
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (_, index) {
                        final itemTask = products[index];
                        return _ProductTile(
                          key: ObjectKey(itemTask),
                          product: itemTask,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.navigator.push(
                CupertinoPageRoute(
                  builder: (context) => AddEntryPage(),
                ),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.redAccent,
          ),
        );
      },
    );
  }
}

class _ProductTile extends StatefulWidget {
  const _ProductTile({Key key, this.product}) : super(key: key);
  final Product product;

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<_ProductTile> {
  Product get product => widget.product;
  Color _color;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, model, child) {
        return Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Tooltip(
                      message: product.inputText,
                      preferBelow: true,
                      child: GestureDetector(
                        onDoubleTap: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: product.inputText,
                            ),
                          );
                        },
                        child: Text(
                          product.inputText,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  ...[
                    Text(product.designCode ?? ''),
                    IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(
                            ClipboardData(text: product.designCode ?? ''));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Alert'),
                              content: Text('Are you sure you want to delete?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Yes'),
                                  onPressed: () {
                                    model.deleteProduct(product);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ],
              ),
              subtitle: SelectableText.rich(
                TextSpan(
                    children: product.inputChoice.split(',').map(
                  (String e) {
                    return TextSpan(
                      text: '$e | ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            final color = e.split('#').last.toColor;
                            if (_color != color) {
                              _color = color;
                            } else {
                              _color = null;
                            }
                          });
                        },
                    );
                  },
                ).toList()),
                style: context.theme.primaryTextTheme.caption.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
