import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:light/clima/service/location.dart';
//import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialApp 示例'),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: Center(
          child: RaisedButton(
              onPressed: () {
                getLocation();
              },
              child: Text('Get Location'))),
    );
  }
}
