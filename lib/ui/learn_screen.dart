import 'package:flutter/material.dart';
import 'package:flutter_list_floor/controllers/learn_controller.dart';
import 'package:flutter_list_floor/database/entitys/main_db_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              return MainMenuItem(_itemsController.getItems[index]);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _itemsController.loadPhase("MAIN2X2");
        },
        tooltip: 'Increment Counter',
        child: Icon(Icons.add), //Change Icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, //Change for different locations
    );
  }
}

class MainMenuItemCard extends StatelessWidget {
  final MainDBItem item;
  MainMenuItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amberAccent,

      child: ListTile(
          dense: false,
          contentPadding: EdgeInsets.all(0.0),
          leading: Container(
              color: Colors.red,
              child:
                  SvgPicture.asset("assets/images/${item.phase.toLowerCase()}/${item.icon}.svg",
                    height: 70, width: 70,
                  ),
          ),
          title: Container(
              color: Colors.green,
              child: Text(item.title)),
          subtitle: Container(
              color: Colors.blue,
              child: Text(item.comment)),
          isThreeLine: false,
          trailing: Icon(Icons.more_vert)),
    );
  }
}

class MainMenuItem extends StatelessWidget {
  final MainDBItem item;
  MainMenuItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Material(
            color: Colors.amberAccent,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.black54,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset("assets/images/${item.phase.toLowerCase()}/${item.icon}.svg",
                    height: 70,
                  ),
                ),
                Text(item.title, softWrap: true, maxLines: 3,),
              ],
            ),
          ),
        ),
    );
  }
}