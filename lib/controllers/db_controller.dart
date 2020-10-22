import 'package:floor/floor.dart';
import 'package:flutter_list_floor/database/main_database.dart';
import 'package:get/get.dart';

class DBController extends GetxController {
  bool needInit = false;
  MainDatabase mainBase;

  Callback callback() => Callback(
      onCreate: (database, version) async {
        print("CreateDataBase callback called");
        needInit = true;
      },
      onOpen: (database) {
        print("OpenDatabase callback called");
      }
  );

  Future<MainDatabase> fillDB() async {
    var db = await $FloorMainDatabase
        .databaseBuilder('main.db')
        .addCallback(callback())
        .build();
    if (needInit) {
      var dao = db.mainDao;
      print("Init DB with db.dao");
      needInit = false;
    } else {
      print("not first start, db.init don't need");
    }
    mainBase = db;
    return mainBase;
  }
}