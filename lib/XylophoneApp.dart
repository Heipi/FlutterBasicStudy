import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

/// This Widget is the main application widget.
class XylophoneApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    playSound(1);
                  },
                  child: Text('one'),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    playSound(2);
                  },
                  child: Text('one'),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Colors.yellow,
                  onPressed: () {
                    playSound(3);
                  },
                  child: Text('one'),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    playSound(4);
                  },
                  child: Text('one'),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Colors.teal,
                  onPressed: () {
                    playSound(5);
                  },
                  child: Text('one'),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    playSound(6);
                  },
                  child: Text('one'),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Colors.purple,
                  onPressed: () {
                    playSound(7);
                  },
                  child: Text('one'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
