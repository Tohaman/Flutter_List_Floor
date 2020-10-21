import 'package:floor/floor.dart';
import 'package:flutter_list_floor/database/daos/abstract_dao.dart';
import 'package:flutter_list_floor/database/entitys/main_db_item.dart';

@dao
abstract class MainDao extends AbstractDao<MainDBItem> {
  @Query('select * from main')
  Stream<List<MainDBItem>> getAllItems();

}
