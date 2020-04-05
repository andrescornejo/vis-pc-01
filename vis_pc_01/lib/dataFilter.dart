import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vispc01/dataSeries.dart';

class DataProvider{

  List<DataSeries> unFilteredDataList;

  List<DataSeries> filteredDataList;



  DataProvider(){
    this.unFilteredDataList = getDataFromJSON();
  }

  List<DataSeries> getDataFromJSON(){
    String jsonString = "assets/data/disabledPeopleCR.json";
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f)=> DataSeries.fromJSON(f)).toList();
  }

}