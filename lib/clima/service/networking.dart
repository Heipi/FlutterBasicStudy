import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      /*   print(data);
      var longitude = jsonDecode(data)['coord']['lon'];
      print(longitude);
      var weatherDescription = jsonDecode(data)['weather'][0]['main'];
      print(weatherDescription);*/
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
