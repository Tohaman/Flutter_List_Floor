import 'package:flutter/material.dart';

class Learn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
      ),
      body: Center(
        child: Container(child: Text('You tapped the FAB 1 times')),
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
