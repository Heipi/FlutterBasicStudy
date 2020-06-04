import 'package:flutter/material.dart';

void main() {
  runApp(MiniCard());
}

class MiniCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage("images/betty.jpg"),
              ),
              Text(
                'Betty',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20.0,
                  color: Colors.teal.shade100,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 150.0,
                height: 20,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+44 123 456 789",
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'betty@email.com',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
Row(
children: <Widget>[
Icon(
Icons.email,
color: Colors.teal,
),
SizedBox(
width: 10.0,
),
Text(
'betty@email.com',
style: TextStyle(
fontSize: 20.0,
color: Colors.teal.shade900,
fontFamily: 'SourceSansPro'),
),
],
),*/

/*
Padding(
padding: const EdgeInsets.all(8.0),
child: Row(
children: <Widget>[
Icon(
Icons.phone,
color: Colors.teal,
),
SizedBox(
width: 10.0,
),
Text(
"+44 123 456 789",
style: TextStyle(
color: Colors.teal.shade900,
fontFamily: 'SourceSansPro',
fontSize: 20.0),
),
],
),
),*/
