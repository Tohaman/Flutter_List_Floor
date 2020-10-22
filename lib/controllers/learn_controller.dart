

import 'package:flutter_list_floor/controllers/repository.dart';
import 'package:flutter_list_floor/database/entitys/main_db_item.dart';
import 'package:get/get.dart';

class LearnController extends GetxController {
  Repository repo = Get.find();

  RxList<MainDBItem> _phaseList = <MainDBItem>[].obs;

  List<MainDBItem> get getItems => _phaseList;

  loadPhase(String phase) async {
    print("loadPhase");
    _phaseList.value = await repo.getMainDBItems(phase);
  }

}