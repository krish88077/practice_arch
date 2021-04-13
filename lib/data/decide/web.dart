import 'package:moor/moor_web.dart';
import 'package:practice_arch/data/moor_database.dart';

AppDatabase constructDb() {
  return AppDatabase(WebDatabase('ffsDb'));
}
