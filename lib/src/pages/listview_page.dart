// Dart
import 'dart:async';
// Flutter
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _numberList = [];
  int _lastNumber = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _add10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _add10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lists")
      ),
      body: Stack(
        children: [
          _createList(),
          _createLoading()
        ]
      )
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numberList[index];

          return FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("https://picsum.photos/400/300/?image=$image")
          );
        }
      ),
      onRefresh: _getPage1
    );
  }

  Future<Null> _getPage1() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _numberList.clear();
      _lastNumber++;
      _add10();
    });

    return Future.delayed(duration);
  }

  void _add10() {
    for(int i=0; i<10; i++) {
      _lastNumber++;
      _numberList.add(_lastNumber);
    }

    setState(() {});
  }

  Future<Null> fetchData() async {
    setState(() => _isLoading = true);

    final duration = Duration(seconds: 2);
    Timer(duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _add10();
  }

  Widget _createLoading() {
    if(_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: CircularProgressIndicator()
          ),
          SizedBox(height: 15.0)
        ]
      );
    } else {
      return Container();
    }
  }
}
