import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:light/clima/service/location.dart';
import 'package:light/clima/service/networking.dart';

import 'location_screen.dart';
//import 'package:geolocator/geolocator.dart';

const apiKey = "81a79366a7ad078d66b53e78ce0e4d58";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
    getLocationData();
  }

  void getLocationData() async {
    /*  Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);*/
//    latitude = location.latitude;
//    longitude = location.longitude;
    latitude = 31.124547;
    longitude = 121.394908;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
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
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
  /*   child: RaisedButton(
              onPressed: () {
                print("DO it");
                getLocationData();
              },
              child: Text('Get Location')))
  * */
}
