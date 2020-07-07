import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '7FA1E354-EBE6-4F9F-8A58-2558EAA6712B';

class CoinData {
  //TODO: Create your getCoinData() method here.

  Future getCoinData(String base, String quote) async {
    String url = "$coinAPIURL/$base/$quote?apikey=$apiKey";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      var lastPrice = decodeData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
