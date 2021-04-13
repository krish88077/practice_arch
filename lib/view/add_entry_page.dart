import 'package:flutter/cupertino.dart';
import 'package:practice_arch/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:practice_arch/view/widget/entry_input_form.dart';
import 'package:provider/provider.dart';

class AddEntryPage extends StatefulWidget {
  @override
  _AddEntryPageState createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, model, child) {
        var child = Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EntryInputForm(),
                ),
              ],
            ),
          ),
        );
        return Scaffold(
          appBar: AppBar(
            title: Text('Add entry'),
          ),
          body: child,
        );
      },
    );
  }
}
