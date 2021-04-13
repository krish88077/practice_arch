import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_arch/data/moor_database.dart';
import 'package:practice_arch/providers/app_provider.dart';
import 'package:practice_arch/view/display_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.db}) : super(key: key);

  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppViewModel>(
          create: (_) => AppViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FFS Admin',
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.redAccent,
        ),
        home: DisplayPage(),
      ),
    );
  }
}
