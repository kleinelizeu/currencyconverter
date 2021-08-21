/*
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies",
      {"apiKey": "de76b6fbc628f52b1afc"});

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      print(currencies);
      return currencies;
    } else {
      throw Exception("Servidor temporáriamente indisponivel");
    }
  }
}
*/
