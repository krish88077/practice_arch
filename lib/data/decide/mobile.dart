import 'dart:ffi';
import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:practice_arch/data/moor_database.dart';
import 'package:sqlite3/open.dart';


DynamicLibrary _openOnWindows() {
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final libraryNextToScript = File('${scriptDir.path}/sqlite3.dll');
  return DynamicLibrary.open(libraryNextToScript.path);
}

AppDatabase constructDb({bool logStatements = false}) {
  open.overrideFor(OperatingSystem.windows, _openOnWindows);
  File dbFile;
  Directory dbFolder;
  if (Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      dbFolder = await getApplicationDocumentsDirectory();
      dbFile = File(path.join(dbFolder.path, 'ffs.sqlite'));
      return VmDatabase(dbFile);
    });
    return AppDatabase(executor);
  }
  if (Platform.isWindows) {
    final executor = LazyDatabase(() async {
      dbFolder = await Directory(Platform.script.path).parent;
      String dbFolderPath = dbFolder.path;
      if (dbFolderPath.startsWith('/')) {
        dbFolderPath = dbFolderPath.substring(1);
      }
      dbFile = File(path.join(dbFolderPath, 'ffs.sqlite'));
      print(dbFile.path);
      return VmDatabase(dbFile);
    });
    return AppDatabase(executor);
  }
  return AppDatabase(VmDatabase.memory(logStatements: logStatements));
}
