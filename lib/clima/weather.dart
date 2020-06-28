import 'package:flutter/material.dart';

import 'loading_screen.dart';

void main() => runApp(MateApp());

class MateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
