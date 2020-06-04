import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Light"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: loadAssetImage(),
      ),
    ),
  ));
}

Image loadAssetImage() {
  return Image(image: AssetImage("images/battery.jpg"));
}

Image loadNetImage() {
  return Image(
      image: NetworkImage(
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=248222817,375547763&fm=26&gp=0.jpg"));
}
