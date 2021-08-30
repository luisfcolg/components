import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final List<String> options = ["One", "Two", "Three", "Four", "Five"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components Temp")
      ),
      body: ListView(
        //children: _createItems()
        children: _createItemsShort()
      )
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = <Widget>[];

    for(String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt)
      );

      list..add(tempWidget)
          ..add(Divider());
    }

    return list;
  }

  List<Widget> _createItemsShort() {
    return options.map((e) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text(e),
            subtitle: Text("Cualquier cosa"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ]
      );
    }).toList();
  }
}
