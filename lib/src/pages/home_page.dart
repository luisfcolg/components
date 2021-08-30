// Flutter
import 'package:flutter/material.dart';
//Providers
import 'package:components/src/providers/menu_provider.dart';
// Utils
import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components")
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context)
        );
      }
    );
  }

  List<Widget> _listItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> options = [];

    data?.forEach((option) {
      final widgetTemp = ListTile(
        title: Text(option["texto"]),
        leading: getIcon(option["icon"]),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, option["ruta"]);
          
          /*final route = MaterialPageRoute(
              builder: (context) => AlertPage()
          );
          Navigator.push(context, route);*/
        }
      );

      options..add(widgetTemp)
             ..add(Divider());
    });

    return options;
  }
}
