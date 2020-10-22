import 'package:flutter/material.dart';

class Learn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
      ),
      body: Center(
        child: ListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment Counter',
        child: Icon(Icons.add), //Change Icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, //Change for different locations
    );
  }
}

class ListWidget extends StatelessWidget {

  Widget _dismissBackground(AlignmentGeometry alignmentGeometry) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      color: Colors.red,
      alignment: alignmentGeometry,
      child: const Icon(
        Icons.delete,
        size: 40,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _itemsController.getItems.length,
      itemBuilder: (_, index) {
        final itemsIndexData = _itemsController.getItems[index];
        return Dismissible(
          secondaryBackground:
          _dismissBackground(Alignment.centerRight),
          background: _dismissBackground(Alignment.centerLeft),
          onDismissed: (_) {
            final Item undoItem = _itemsController
                .getItemById(itemsIndexData.stringId);

            _itemsController.removeItem(itemsIndexData.stringId);

            _scaffoldKey.currentState.hideCurrentSnackBar();
            final snackBar = SnackBar(
              backgroundColor: Colors.black,
              content: const Text(
                'Undo Delete',
                style: const TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                textColor: Colors.blue,
                label: 'Undo',
                onPressed: () => _itemsController.undoDelete(
                  index,
                  undoItem,
                ),
              ),
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          },
          key: Key(itemsIndexData.stringId),
          child: ItemTile(
            itemId: itemsIndexData.stringId,
            index: index,
            title: itemsIndexData.title,
            dateTime: itemsIndexData.dateTime,
          ),
        );
      },
    );
  }
}
