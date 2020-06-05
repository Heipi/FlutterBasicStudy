import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dicee"),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ));

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                changeDiceFace();
                print("left button");
              },
              child: Image.asset("images/dice$leftDiceNumber.png"),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                print("right button");
                changeDiceFace();
              },
              child: Image(
                image: AssetImage("images/dice$rightDiceNumber.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

/*  FlatButton button() {
    print('btn');
    return Dtn(
      onPressed: () {
        print("right button");
        changeDiceFace();
      },
      child: Itn(
        image: AssetImage("images/dice$rightDiceNumber.png"),
      ),
    );
  }*/
}

/*
class Itn extends Image {
  Itn({
    ImageProvider image,
  }) : super(image: image) {
    print('Itn ...33');
  }
}

class Dtn extends FlatButton {
  Dtn({
    VoidCallback onPressed,
    Widget child,
  }) : super(onPressed: onPressed, child: child) {
    print('DTN ...');
  }
}
*/
