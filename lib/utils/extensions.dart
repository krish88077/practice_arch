import 'package:practice_arch/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension BuildContextUtils on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  ThemeData get theme => Theme.of(this);

  AppViewModel get appViewModel =>
      Provider.of<AppViewModel>(this, listen: false);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

extension StringUtils on String {
  Color get toColor => Color(int.parse('FF$this', radix: 16));
}
