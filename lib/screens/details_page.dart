import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/widgetsandvariables/widgets.dart';

class Details extends StatelessWidget {

  String name;
  String native;
  String phone;
  String continent;
  String capital;
  String currency;
  String languages;
  String emoji;
  String emojiU;

  Details(
    this.name,
    this.native,
    this.phone,
    this.continent,
    this.capital,
    this.currency,
    this.languages,
    this.emoji,
    this.emojiU,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${name}'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          myContainer(name),
          myRow('native     ', native),
          myRow('phone      ', phone),
          myRow('continent  ', continent),
          myRow('capital    ', capital),
          myRow('currency   ', currency),
          myRow('languages  ', languages),
          myRow('emoji      ', emoji),
        ],
      ),
    );
  }


}
