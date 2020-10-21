
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'daos/main_dao.dart';
import 'entitys/main_db_item.dart';

part 'main_database.g.dart';

@Database(version: 1, entities: [MainDBItem])
abstract class MainDatabase extends FloorDatabase{
  MainDao get mainDao;
}