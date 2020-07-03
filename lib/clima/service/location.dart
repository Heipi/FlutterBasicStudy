import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

//  Location(this.latitude, this.longitude);
  Future<void> getCurrentLocation() async {
    try {
      print('=====' + "---");
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print('=====' + position.toString());
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}