import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: BallPage(),
  ));
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Ask Me Anything"),
      ),
      body: MagicBall(),
    );
  }
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    print("action");
    return Center(
      child: FlatButton(
          onPressed: () {
            setState(() {
              print("I got clicked");
              ballNumber = Random().nextInt(5) + 1;
              print("ballNumber==$ballNumber");
            });
          },
          child: Image.asset('images/ball$ballNumber.png')),
    );
  }
}
