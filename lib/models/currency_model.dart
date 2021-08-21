import 'dart:convert';
import 'package:http/http.dart' as http;

Future<CurrencyModel> fetchCurrency() async {
  var url =
      "https://api.hgbrasil.com/finance?format=json&key=751c3201=db089e24";

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return CurrencyModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Falha ao carregar dados");
  }
}

class CurrencyModel {
  // final dynamic name;
  // final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  CurrencyModel({this.dolar, this.euro, this.bitcoin});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      dolar: json["results"]["currencies"]["USD"]["buy"],
      euro: json["results"]["currencies"]["EUR"]["buy"],
      bitcoin: json["results"]["currencies"]["BTC"]["buy"],
    );
  }
}
