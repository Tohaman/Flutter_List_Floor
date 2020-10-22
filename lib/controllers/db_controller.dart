import 'package:floor/floor.dart';
import 'package:flutter_list_floor/controllers/repository.dart';
import 'package:flutter_list_floor/database/entitys/main_db_item.dart';
import 'package:flutter_list_floor/database/entitys/phases.dart';
import 'package:flutter_list_floor/database/main_database.dart';
import 'package:flutter_list_floor/res/mainMenu/main2x2.dart';
import 'package:flutter_list_floor/res/mainMenu/main3x3.dart';
import 'package:flutter_list_floor/res/mainMenu/main3x3/rozov.dart';
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
    mainBase = await $FloorMainDatabase
        .databaseBuilder('main.db')
        .addCallback(callback())
        .build();
    if (needInit) {
      await _initPhase(Main2x2());
      await _initPhase(Main3x3());
      await _initPhase(Rozov());
      print("Init DB with db.dao");
      needInit = false;
    } else {
      print("not first start, db.init don't need");
    }

    return mainBase;
  }

  Future _initPhase(Phase phase) async {
    for (var i = 0; i < phase.count; i++) {
      var item = MainDBItem(
          phase: phase.phase,
          id: i,
          title: phase.titles()[i],
          icon: phase.icons()[i],
          description: phase.descriptions()[i],
          url: phase.urls()[i],
          comment: phase.comments()[i],
          isFavourite: false,
          favComment: "",
          subId: 0);
      mainBase.mainDao.insertItem(item);
    }
  }

}