import 'package:flutter/material.dart';
import 'package:flutter_list_floor/controllers/learn_controller.dart';
import 'package:get/get.dart';

class Learn extends StatelessWidget {
  final LearnController _itemsController = Get.find();

  @override
  Widget build(BuildContext context) {
    print("build Learn");
    _itemsController.loadPhase("MAIN3X3");
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
      ),
      body: Obx(
        () => Center(
          child: ListView.builder(
            itemCount: _itemsController.getItems.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(_itemsController.getItems[index].title),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment Counter',
        child: Icon(Icons.add), //Change Icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, //Change for different locations
    );
  }
}
