import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _lockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider")
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(
              child: _createImage()
            )
          ]
        )
      )
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Image size",
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: _lockCheck ? null : (value) => setState(() => _sliderValue = value)
    );
  }

  Widget _createCheckbox() {
    /*return Checkbox(
        value: _lockCheck,
        onChanged: (value) => setState(() => _lockCheck = value!)
    );*/

    return CheckboxListTile(
      title: Text("Bloquear slider"),
      value: _lockCheck,
      onChanged: (value) => setState(() => _lockCheck = value!)
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text("Bloquear slider"),
      value: _lockCheck,
      onChanged: (value) => setState(() => _lockCheck = value)
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage("https://static.vix.com/es/sites/default/files/d/daredevil-t3.jpg"),
      width: _sliderValue,
      fit: BoxFit.contain
    );
  }
}
