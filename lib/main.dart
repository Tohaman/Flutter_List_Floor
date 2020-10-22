import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_floor/controllers/db_controller.dart';
import 'package:flutter_list_floor/controllers/learn_controller.dart';
import 'package:flutter_list_floor/controllers/repository.dart';
import 'package:get/get.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'database/main_database.dart';
import 'ui/learn_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final dbFuture = Get.put(DBController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FutureBuilder<MainDatabase>(
        future: dbFuture.fillDB(),
        builder: (BuildContext context, AsyncSnapshot<MainDatabase> data) {
          if (data.hasData) {
            print(data.data.toString());
            putDAOs(data.data);
            return Learn();
          } else if (data.hasError) {
            return Center(child: Text("Can't create or open database"));
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void putDAOs(MainDatabase db) {
    print("putDAOs");
    Get.put(db.mainDao);
    Get.put(Repository());
    Get.put(LearnController());
  }
}
