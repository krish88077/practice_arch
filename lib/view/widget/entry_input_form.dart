import 'package:practice_arch/model/product.dart';
import 'package:practice_arch/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_provider.dart';

class EntryInputForm extends StatefulWidget {
  const EntryInputForm({
    Key key,
    this.product,
  }) : super(key: key);

  final Product product;

  @override
  _EntryInputFormState createState() => _EntryInputFormState();
}

class _EntryInputFormState extends State<EntryInputForm> {
  TextEditingController _textController;
  List<String> _choiceList = '''
Royal Blue  #00044a
Purple  #1c0026
Red  #a50303
Yellow  #ffd02f
Golden Yellow  #f0ab00
New Yellow  #fcfa30'''
      .split('\n');

  List<String> selectedChoiceList = [];
  String choiceListStringToDb = '';

  var _choices = GlobalKey();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, model, child) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _textController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Text',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: MultiSelectChip(
              _choiceList,
              selected: selectedChoiceList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedChoiceList = selectedList;
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            child: ElevatedButton(
              child: Text('Add'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.primaryColor),
              ),
              onPressed: () async {
                if (_textController.text.isEmpty) {
                  context.scaffoldMessenger.showSnackBar(SnackBar(
                    content: Text('Text empty !!!'),
                  ));
                  return;
                } else if (selectedChoiceList.isEmpty) {
                  context.scaffoldMessenger.showSnackBar(SnackBar(
                    content: Text('Please choose a color variant!'),
                  ));
                  return;
                }
                setState(() {
                  choiceListStringToDb = selectedChoiceList
                      .where((element) => element?.isNotEmpty ?? false)
                      .join(',');
                });
                final Product builtProduct = Product((ProductBuilder b) async => b
                  ..inputText = _textController.text
                  ..inputChoice = choiceListStringToDb
                );
                model.insertProduct(builtProduct,);
                resetValuesAfterSubmit();
                context.scaffoldMessenger.showSnackBar(SnackBar(
                  content: Text('Added entry !!!'),
                  duration: Duration(seconds: 3),
                ));
              },
            ),
          ),
        ],
      );
    });
  }

  void resetValuesAfterSubmit() {
    setState(() {
      _textController.clear();
      selectedChoiceList.clear();
      choiceListStringToDb = '';
    });
  }
}

class MultiSelectChip extends StatelessWidget {
  final List<String> _choiceList;
  final List<String> selected;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this._choiceList,
      {Key key, this.selected, this.onSelectionChanged})
      : super(key: key);

  List<String> get selectedChoices => [...selected];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 4,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      children: (_choiceList
            ..sort((a, b) {
              var aLum = a.split('#').last.toColor.computeLuminance();
              var bLum = b.split('#').last.toColor.computeLuminance();
              return aLum.compareTo(bLum);
            }))
          .map(
        (item) {
          var color = item.split('#').last.toColor;
          var selected = selectedChoices.contains(item);
          var textColor =
              color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
          return TextButton(
            onPressed: () {
              onSelectionChanged(
                selected
                    ? (selectedChoices..remove(item))
                    : (selectedChoices..add(item)),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return states.contains(MaterialState.hovered) ||
                        states.contains(MaterialState.focused)
                    ? color.withAlpha(150)
                    : color;
              }),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 8.0,
                ),
                if (selected)
                  Icon(
                    Icons.check_box_outlined,
                    color: textColor,
                  )
                else
                  Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: textColor,
                  ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Text(
                    item.replaceAll('#', '\n#'),
                    style: context.theme.primaryTextTheme.caption.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
