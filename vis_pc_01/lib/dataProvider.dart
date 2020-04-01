import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vispc01/dataSeries.dart';

class DataProvider{

  Future<List<DataSeries>> getDataFromJSON(BuildContext context) async{
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/disabledPeopleCR.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f)=> DataSeries.fromJSON(f)).toList();
  }

}