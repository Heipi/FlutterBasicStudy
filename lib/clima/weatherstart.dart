// @dart=2.9
import 'package:flutter/material.dart';

import 'screen/loading_screen.dart';

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
