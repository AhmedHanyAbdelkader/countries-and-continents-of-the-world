import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class Data {

  List countries = [];
  List continents = [];
  Map data = {};

  Future<void> readjson([key, value]) async {
    var jsonText = await rootBundle.loadString('assets/data.json');
    data = await json.decode(jsonText);
  }

  Future<dynamic> getContinents() async {
    await readjson();
    var continentsJson = data['continents'];
    await continentsJson.forEach((key, value) {
      continents.add(value);
    });
    //print(continents);
  }

  List f = [];
  String p;
  Future<dynamic> getCountries(p) async {
    await readjson();
    var countriesJson = data['countries'];
    await countriesJson.forEach((key, value) {
      countries.add(value);
    });
    countries.forEach((element) {
      if (element['continent'] == '${p}') f.add(element);
    });
  }

  List ffuns = [];
  List funs = [];

  dynamic fun(index) {
    funs.add(index);
    return funs;
  }
}
