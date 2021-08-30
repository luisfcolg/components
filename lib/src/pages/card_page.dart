import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards")
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2()
        ]
      )
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("Card title"),
            subtitle: Text("This is the description for the card of the ListTile that is inside the Card."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () {},
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {},
              )
            ]
          )
        ]
      )
    );
  }

  Widget _cardType2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage("https://tvazteca.brightspotcdn.com/e2/c3/e5f95b5340d2be5b8a42f40c6a8c/tomorrowland.jpg"),
            placeholder: AssetImage("assets/jar-loading.gif"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover
          ),
          /*Image(
            image: NetworkImage("https://tvazteca.brightspotcdn.com/e2/c3/e5f95b5340d2be5b8a42f40c6a8c/tomorrowland.jpg"),
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Tomorrowland")
          )
        ]
      )
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card
      )
    );
  }
}
