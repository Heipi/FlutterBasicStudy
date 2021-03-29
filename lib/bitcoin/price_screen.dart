import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:light/bitcoin/coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'AUD';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
//      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: pickerItems,
    );
  }

  String base = "BTC";
  @override
  void initState() {
    super.initState();
    getData();
  }

//  String bitcoinValue = '?';
//  List<String> bitCoinValue = ['?', "?", "?"];
  Map<String, String>? bitCoinValues = {};
  bool isWaiting = false;
  void getData() async {
    isWaiting = true;
    try {
//      double data = await CoinData().getCoinData(base, selectedCurrency);
      var data = await CoinData().getCoinData(selectedCurrency!);
      isWaiting = false;
      setState(() {
//        bitcoinValue = data.toStringAsFixed(0);
        bitCoinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  ////For bonus points, create a method that loops through the cryptoList and generates a CryptoCard for each. Call makeCards() in the build() method instead of the Column with 3 CryptoCards.
//  Column makeCards() {
//    List<CryptoCard> cryptoCards = [];
//    for (String crypto in cryptoList) {
//      cryptoCards.add(
//        CryptoCard(
//          cryptoCurrency: crypto,
//          selectedCurrency: selectedCurrency,
//          value: isWaiting ? '?' : coinValues[crypto],
//        ),
//      );
//    }
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      children: cryptoCards,
//    );
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //spaceBetween
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CryptoCard(
                crypto: cryptoList[0],
                selectedCurrency: selectedCurrency,
                bitcoinValue: isWaiting ? '?' : bitCoinValues?['BTC'],
              ),
              CryptoCard(
                  crypto: cryptoList[1],
                  bitcoinValue: isWaiting ? '?' : bitCoinValues?[cryptoList[1]],
                  selectedCurrency: selectedCurrency),
              CryptoCard(
                  crypto: cryptoList[2],
                  bitcoinValue: isWaiting ? '?' : bitCoinValues?[cryptoList[2]],
                  selectedCurrency: selectedCurrency),
            ],
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:
                iosPicker(), //Platform.isIOS ? iosPicker() : androidDropdown()
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    Key? key,
    required this.crypto,
    required this.bitcoinValue,
    required this.selectedCurrency,
  }) : super(key: key);

  final String? bitcoinValue;
  final String? selectedCurrency;
  final String? crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $bitcoinValue $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
