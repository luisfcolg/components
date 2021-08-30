import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("http://marveltoynews.com/wp-content/uploads/2016/09/Neutral-Face-Daredevil-Charlie-Cox-Hot-Toys-Figure-Portrait-e1474899347844.jpg"),
            )
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("LL"),
              backgroundColor: Colors.green,
            )
          )
        ]
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://static.vix.com/es/sites/default/files/d/daredevil-t3.jpg"),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration(milliseconds: 200)
        )
      )
    );
  }
}
