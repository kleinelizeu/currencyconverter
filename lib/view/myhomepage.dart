import 'package:conversor_de_moedas/components/currency_box.dart';
import 'package:conversor_de_moedas/models/currency_model.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _realController = TextEditingController();
  final _dollarController = TextEditingController();
  final _euroController = TextEditingController();
  final _bitcoinController = TextEditingController();

  double dolarData;
  double euroData;
  double bitcoinData;

  void _clearAll() {
    _realController.text = "";
    _dollarController.text = "";
    _euroController.text = "";
    _bitcoinController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    _dollarController.text = (real / dolarData).toStringAsFixed(2);
    _euroController.text = (real / euroData).toStringAsFixed(2);
    _bitcoinController.text = (real / bitcoinData).toStringAsFixed(2);
  }

  void _dollarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    _realController.text = (dolar * dolarData).toStringAsFixed(2);
    _euroController.text = (dolar * euroData).toStringAsFixed(2);
    _bitcoinController.text = (dolar * bitcoinData).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    _realController.text = (euro * euroData).toStringAsFixed(2);
    _dollarController.text = (euro * dolarData).toStringAsFixed(2);
    _bitcoinController.text = (euro * bitcoinData).toStringAsFixed(2);
  }

  void _bitcoinChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double bitcoin = double.parse(text);
    _realController.text = (bitcoin * bitcoinData).toStringAsFixed(2);
    _dollarController.text = (bitcoin * dolarData).toStringAsFixed(2);
    _euroController.text = (bitcoin * bitcoinData).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder(
        future: fetchCurrency(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Erro ao buscar dados"),
            );
          } else {
            dolarData = snapshot.data.dolar;
            euroData = snapshot.data.euro;

            bitcoinData = snapshot.data.bitcoin;

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.1),
                      child: Container(
                        child: Text(
                          "CURRENCY CONVERTER",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: size.height * 0.28,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                                vertical: size.height * 0.02,
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/640px-Flag_of_Brazil.svg.png",
                                    height: size.height * 0.07,
                                    width: size.width * 0.2,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "BRA",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "BRL",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: size.width * 0.08,
                                left: size.width * 0.08,
                                top: size.height * 0.03,
                              ),
                              child: BuildTextField(
                                controller: _realController,
                                labelText: "Real",
                                onChange: _realChanged,
                                text: "BRL",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: size.height * 0.28,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                                vertical: size.height * 0.02,
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://www.merchantstronghold.com/currency/wp-content/uploads/2017/05/usd-1.png",
                                    height: size.height * 0.07,
                                    width: size.width * 0.2,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "USA",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "USD",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: size.width * 0.08,
                                left: size.width * 0.08,
                                top: size.height * 0.03,
                              ),
                              child: BuildTextField(
                                controller: _dollarController,
                                labelText: "Dolar",
                                onChange: _dollarChanged,
                                text: "USD",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: size.height * 0.28,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                                vertical: size.height * 0.02,
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/640px-Flag_of_Europe.svg.png",
                                    height: size.height * 0.07,
                                    width: size.width * 0.2,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "UE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "EUR",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: size.width * 0.08,
                                left: size.width * 0.08,
                                top: size.height * 0.03,
                              ),
                              child: BuildTextField(
                                controller: _euroController,
                                labelText: "Euro",
                                onChange: _euroChanged,
                                text: "EUR",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: size.height * 0.28,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                                vertical: size.height * 0.02,
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://media.istockphoto.com/vectors/simple-orange-bitcoin-flag-tilted-btc-symbol-in-circle-vector-id1135211279?k=6&m=1135211279&s=170667a&w=0&h=sExiJDY3M7ihuwy20LdBoQjpS4g-f0D7O5VXWJpy36U=",
                                    height: size.height * 0.07,
                                    width: size.width * 0.2,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "BTC",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "BTC",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: size.width * 0.08,
                                left: size.width * 0.08,
                                top: size.height * 0.03,
                              ),
                              child: BuildTextField(
                                controller: _bitcoinController,
                                labelText: "Bitcoin",
                                onChange: _bitcoinChanged,
                                text: "BTC",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class BuildTextField extends StatelessWidget {
  BuildTextField({
    @required this.controller,
    @required this.labelText,
    @required this.onChange,
    @required this.text,
  });

  final TextEditingController controller;
  final String labelText;
  final Function onChange;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        suffix: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        labelText: labelText,
      ),
      onChanged: onChange,
    );
  }
}
