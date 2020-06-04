import 'package:flutter/material.dart';

void main() {
  runApp(CardWidget());
}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: SafeArea(
          child: Row(
//            mainAxisSize: MainAxisSize.min,
//            verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
//                margin: EdgeInsets.all(20),
//            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
//                padding: EdgeInsets.all(20),
                color: Colors.red,
                child: Text("hello"),
              ),
//              SizedBox(
//                width: 1,
//                height: 0,
//              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.yellow,
                    child: Text("2"),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.yellow[50],
                    child: Text("2"),
                  ),
                ],
              ),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: Text("3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
