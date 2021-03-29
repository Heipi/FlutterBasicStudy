import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

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
      print("Error==" + e.toString());
    }
  }
}
