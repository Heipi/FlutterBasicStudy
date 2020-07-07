import 'package:flutter/material.dart';
import 'package:light/bitcoin/price_screen.dart';

void main() {
  runApp(BitCoin());
}

class BitCoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PriceScreen(),
    );
  }
}
