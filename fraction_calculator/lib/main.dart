import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Fraction Calculator App',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final double _minimumPadding = 5.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _num1ctrl = new TextEditingController();
  TextEditingController _num2ctrl = new TextEditingController();
  TextEditingController _num3ctrl = new TextEditingController();
  TextEditingController _num4ctrl = new TextEditingController();
  double decimal = 0.0;
  int fraction = 0, fraction1 = 0;
  List<String> _calculation = ['+', '-', '*', '/'];
  String _newValueSelected, ans;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blueGrey,
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Fraction Calculator'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(children: <Widget>[
          getImageAsset(),
          new Column(children: [
            new Row(children: [
              new Expanded(
                  child: TextField(
                controller: _num1ctrl,
                keyboardType: TextInputType.numberWithOptions(),
                autofocus: false,
                style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    hintStyle: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: (Color(0xFF303030))),
                    labelStyle: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: (Color(0xFF000000))),
                    labelText: 'Numerator',
                    hintText: 'Input Any Number',
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    )),
              )),
              Container(
                width: _minimumPadding * 5,
              ),
              new Expanded(
                  child: TextField(
                controller: _num3ctrl,
                keyboardType: TextInputType.numberWithOptions(),
                autofocus: false,
                style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    hintStyle: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: (Color(0xFF303030))),
                    labelStyle: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: (Color(0xFF000000))),
                    labelText: 'Numerator',
                    hintText: 'Input Any Number',
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    )),
              )),
            ]),
            Padding(
              padding: EdgeInsets.only(
                  bottom: _minimumPadding, top: _minimumPadding),
              child: Row(children: [
                new Expanded(
                  child: new Text(
                    '______________________________________',
                    style: new TextStyle(
                        fontSize: 10.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Merriweather"),
                  ),
                ),
                Container(
                  width: _minimumPadding * 5,
                ),
                new Expanded(
                  child: new Text(
                    '______________________________________',
                    style: new TextStyle(
                        fontSize: 10.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Merriweather"),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: _minimumPadding, top: _minimumPadding),
              child: Row(children: [
                new Expanded(
                    child: TextField(
                  controller: _num2ctrl,
                  keyboardType: TextInputType.numberWithOptions(),
                  autofocus: false,
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      hintStyle: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (Color(0xFF303030))),
                      labelStyle: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (Color(0xFF000000))),
                      labelText: 'Denominator',
                      hintText: 'Input Any Number',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      )),
                )),
                Container(
                  width: _minimumPadding * 5,
                ),
                new Expanded(
                    child: TextField(
                  controller: _num4ctrl,
                  keyboardType: TextInputType.numberWithOptions(),
                  autofocus: false,
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      hintStyle: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (Color(0xFF303030))),
                      labelStyle: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (Color(0xFF000000))),
                      labelText: 'Denominator',
                      hintText: 'Input Any Number',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      )),
                )),
              ]),
            ),
          ]),
          Padding(
              padding: EdgeInsets.only(
                  bottom: _minimumPadding, top: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: DropdownButton(
                    hint: Text(
                      'Please choose an operation',
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Merriweather"),
                    ),
                    value: _newValueSelected,
                    onChanged: (newValue) {
                      setState(() {
                        _newValueSelected = newValue;
                      });
                    },
                    items: _calculation.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location,
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.bold,
                                fontFamily: "Merriweather")),
                        value: location,
                      );
                    }).toList(),
                  )),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                  bottom: _minimumPadding, top: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.lightBlueAccent,
                      child: Text(
                        'Calculate',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: const Color(0xFF212121),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Merriweather"),
                      ),
                      onPressed: _onPress,
                    ),
                  ),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.lightBlueAccent,
                      child: Text(
                        'Reset',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: const Color(0xFF212121),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Merriweather"),
                      ),
                      onPressed: () {
                        this.setState(() {
                          _num1ctrl.clear();
                          _num2ctrl.clear();
                          _num3ctrl.clear();
                          _num4ctrl.clear();
                          ans='';
                          fraction=0;
                          fraction1=0;
                        });
                      },
                    ),
                  ),
                ],
              )),
          Padding(
            padding:
                EdgeInsets.only(bottom: _minimumPadding, top: _minimumPadding),
            child: new Text(
              "Result:",
              style: new TextStyle(
                  fontSize: 26.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoMono"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: _minimumPadding * 2, top: _minimumPadding * 3),
            child: new Column(children: [
              new Row(children: [
                new Text(
                  "FRACTION:",
                  style: new TextStyle(
                      fontSize: 22.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontFamily: "RobotoMono"),
                ),
                Container(
                  width: _minimumPadding * 20,
                ),
                new Text(
                  "DECIMAL:",
                  style: new TextStyle(
                      fontSize: 22.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontFamily: "RobotoMono"),
                ),
              ]),
            ]),
          ),
          new Column(children: [
            new Row(children: [
              new Text(
                "$fraction",
                style: new TextStyle(
                    fontSize: 22.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontFamily: "RobotoMono"),
              ),
              Container(
                width: _minimumPadding * 40,
              ),
              new Text(
                "$ans",
                style: new TextStyle(
                    fontSize: 22.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontFamily: "RobotoMono"),
              ),
            ]),
          ]),
          Padding(
            padding: EdgeInsets.only(bottom: _minimumPadding * 2),
            child: Row(children: [
              new Expanded(
                  child: new Text(
                '_________',
                style: new TextStyle(
                    fontSize: 10.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Merriweather"),
              )),
            ]),
          ),
          new Row(children: [
            new Text(
              "$fraction1",
              style: new TextStyle(
                  fontSize: 22.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoMono"),
            ),
          ]),
        ]),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('assets/images/calculator.jpg');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onPress() {
    setState(() {
      int a = int.parse(_num1ctrl.text);
      int b = int.parse(_num2ctrl.text);
      int c = int.parse(_num3ctrl.text);
      int d = int.parse(_num4ctrl.text);
      double div1 = a / b;
      double div2 = c / d;

      if (b != 0 && d != 0) {
        if (_newValueSelected == '+') {
          decimal = div1 + div2;
          ans = decimal.toStringAsFixed(3);

          fraction = (a * d) + (c * b);
          fraction1 = (b * d);
        } else if (_newValueSelected == '-') {
          decimal = div1 - div2;
          ans = decimal.toStringAsFixed(3);

          fraction = (a * d) - (c * b);
          fraction1 = (b * d);
        } else if (_newValueSelected == '*') {
          decimal = div1 * div2;
          ans = decimal.toStringAsFixed(3);

          fraction = (a * c);
          fraction1 = (b * d);
        } else {
          decimal = div1 / div2;
          ans = decimal.toStringAsFixed(3);

          fraction = (a * d);
          fraction1 = (b * c);
        }
      } else {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Please provide none zero numbers in denominator!'),
          duration: Duration(seconds: 5),
        ));
      }
    });
  }
}
