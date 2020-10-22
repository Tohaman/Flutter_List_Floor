import 'package:flutter_list_floor/database/daos/main_dao.dart';
import 'package:flutter_list_floor/database/entitys/main_db_item.dart';
import 'package:flutter_list_floor/database/main_database.dart';
import 'package:get/get.dart';

class Repository extends GetxController {
  MainDao _mainDao = Get.find();

  List<MainDBItem> _cache = [];

  Future<List<MainDBItem>> getMainDBItems(String phase) async {
    //if (_cache.isEmpty) { _cache = await _mainDao.getAllItems();}
    var result = await _mainDao.getPhase(phase);
    return result;
  }
}
