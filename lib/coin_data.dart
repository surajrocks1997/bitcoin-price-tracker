import 'package:http/http.dart' as http;
import 'dart:convert';

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

const url = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  List<double> rate = [];
  List<double> data = [];

  Future<List<double>> getCoinData(String currency) async {
    for (var i = 0; i < cryptoList.length; i++) {
      http.Response response =
          await http.get('$url/${cryptoList[i]}/$currency', headers: {
        'X-CoinAPI-Key': 'YOUR KEY GOES HERE',
        'Accept': 'application/json',
        'Accept-Encoding': 'deflate'
      });
      var decodedData = jsonDecode(response.body);
      print(decodedData['rate']);
      data.add(decodedData['rate']);
    }

    return data;
  }
}
