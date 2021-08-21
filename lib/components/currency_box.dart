import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyBox extends StatelessWidget {
  const CurrencyBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                height: size.height * 0.09,
                child: DropdownButton(
                  isExpanded: true,
                  underline: Container(
                    height: size.height * 0.001,
                    color: Colors.amber,
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text("Dolar"),
                    ),
                    DropdownMenuItem(
                      child: Text("Real"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
