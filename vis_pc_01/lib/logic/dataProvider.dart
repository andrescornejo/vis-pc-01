/* Author: Andrés Cornejo
 * Class: DataProvider
 * Description: Filters all the data given by a DataSeries list, and sorts it into lists per disability.
 *              It's meant to feed data to the chart generating classes.
 *
 * How filtering works: There are four filter layers.
 * 1. masterFilter(): It takes care of filtering by disability, and calls the next level filter.
 * 2. filterList(): It filters out by sex.
 * 3. filterList(): It filters out the age groups and calls the next level filter.
 * 4. province filter
 */

import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:vispc01/charts/barChart.dart';
import 'package:vispc01/charts/pieChart.dart';
import 'package:vispc01/logic/dataSeries.dart';
import 'package:vispc01/logic/disabilitySeries.dart';
import 'package:vispc01/libraries/globals.dart' as globals;

class DataProvider extends StatefulWidget {
  State createState() => new DataProviderState();
}


class DataProviderState extends State<DataProvider>{

  List<DataSeries> unFilteredDataList = new List<DataSeries>();

  List<DisabilitySeries> eyeDisabilityList = new List<DisabilitySeries>();
  List<DisabilitySeries> earDisabilityList = new List<DisabilitySeries>();
  List<DisabilitySeries> talkDisabilityList = new List<DisabilitySeries>();
  List<DisabilitySeries> walkDisabilityList = new List<DisabilitySeries>();
  List<DisabilitySeries> armDisabilityList = new List<DisabilitySeries>();
  List<DisabilitySeries> intellectDisabilityList = new List<DisabilitySeries>();
  List<DisabilitySeries> mentalDisabilityList = new List<DisabilitySeries>();

  List<Widget> widgetList = new List<Widget>();

  @override
  Widget build(BuildContext context) {
    buildUnfilteredList(context);
    buildDisabilityLists();
    masterFilter();

    print(eyeDisabilityList.toString());


//    masterFilter(this.earDisabilityList);
    if(widgetList.isEmpty)
      widgetList.add(Text("List Empty"));

    return Column(children: widgetList);
  }

  /* The master filter

   */
  void masterFilter(){
    //EYE DISABILITY LIST
    if(globals.disblEYES) {
      filterList(this.eyeDisabilityList);
      splitProvinces(this.eyeDisabilityList, "ocular");
    }else
      this.eyeDisabilityList.clear();

    //EAR DISABILITY LIST
    if(globals.disblEARS) {
      filterList(this.earDisabilityList);
      splitProvinces(this.earDisabilityList, "auditiva");
    }
    else
      this.earDisabilityList.clear();

    //TALK DISABILITY LIST
    if(globals.disblTALK) {
      filterList(this.talkDisabilityList);
      splitProvinces(this.talkDisabilityList, "para hablar");
    }
    else
      this.talkDisabilityList.clear();

    //WALK DISABILITY LIST
    if(globals.disblWALK) {
      filterList(this.walkDisabilityList);
      splitProvinces(this.walkDisabilityList, "para caminar");
    }
    else
      this.earDisabilityList.clear();

    //ARM DISABILITY LIST
    if(globals.disblARMS) {
      filterList(this.armDisabilityList);
      splitProvinces(this.armDisabilityList, "de brazos o manos");
    }
    else
      this.armDisabilityList.clear();

    //INTELLECT DISABILITY LIST
    if(globals.disblINTEL) {
      filterList(this.intellectDisabilityList);
      splitProvinces(this.intellectDisabilityList, "intelectual");
    }
    else
      this.intellectDisabilityList.clear();

    if(globals.disblMIND) {
      filterList(this.mentalDisabilityList);
      splitProvinces(this.mentalDisabilityList, "mental");
    }
    else
      this.mentalDisabilityList.clear();

  }

  void filterList(List<DisabilitySeries> inputList){
    if(globals.sexM == false)
      inputList.removeWhere((item) => item.sex == "M");
    if(globals.sexF == false)
      inputList.removeWhere((item) => item.sex == "F");
    if(globals.age0to14 == false)
      inputList.removeWhere((item) => item.ageGroup == "0to14");
    if(globals.age15to34 == false)
      inputList.removeWhere((item) => item.ageGroup == "15to34");
    if(globals.age35to54 == false)
      inputList.removeWhere((item) => item.ageGroup == "35to54");
    if(globals.age55to74 == false)
      inputList.removeWhere((item) => item.ageGroup == "55to74");
    if(globals.age75plus == false)
      inputList.removeWhere((item) => item.ageGroup == "75plus");
  }

  void splitProvinces(List<DisabilitySeries> inputList, String disabilityType){

    List<DisabilitySeries> tmpList = new List<DisabilitySeries>();
    tmpList.clear();

    //SAN JOSE
    if(globals.provSJ == true){
      for (var item in inputList) {
        if (item.province == "SJ")
          tmpList.add(item);
      }
      buildHelper(tmpList, "San José", disabilityType);
      tmpList.clear();
    }else
      inputList.removeWhere((item) => item.province == "SJ");

    //ALAJUELA
    if(globals.provAL == true){
      for (var item in inputList) {
        if (item.province == "AL")
          tmpList.add(item);
      }
      buildHelper(tmpList, "Alajuela", disabilityType);
      tmpList.clear();
    }else
      inputList.removeWhere((item) => item.province == "AL");

    //CARTAGO
    if(globals.provCAR == true){
      for (var item in inputList) {
        if (item.province == "CAR")
          tmpList.add(item);
      }
      buildHelper(tmpList, "Cartago", disabilityType);
      tmpList.clear();
    }else
      inputList.removeWhere((item) => item.province == "CAR");

    //HEREDIA
    if(globals.provHER == true){
      for (var item in inputList) {
        if (item.province == "HER")
          tmpList.add(item);
      }
      buildHelper(tmpList, "Heredia", disabilityType);
      tmpList.clear();
    }else
      inputList.removeWhere((item) => item.province == "HER");

    //GUANACASTE
    if(globals.provGUAN == true){
      for (var item in inputList) {
        if (item.province == "GUAN")
          tmpList.add(item);
      }
      buildHelper(tmpList, "Guanacaste", disabilityType);
      tmpList.clear();
    }else
      inputList.removeWhere((item) => item.province == "GUAN");

    //PUNTARENAS
    if(globals.provPUN == true){
      for (var item in inputList) {
        if (item.province == "PUN")
          tmpList.add(item);
      }
      buildHelper(tmpList, "Puntarenas", disabilityType);
      tmpList.clear();
    }else
      inputList.removeWhere((item) => item.province == "PUN");

    //LIMON
    if(globals.provLIM == true){
      for (var item in inputList) {
        if (item.province == "LIM")
          tmpList.add(item);
      }
      buildHelper(tmpList, "Limón", disabilityType);
      tmpList.clear();
    }else
      inputList.removeWhere((item) => item.province == "LIM");
  }

  Widget chartTypeSelector(List<DisabilitySeries> inputList){
    List<DisabilitySeries> maleList = getMaleList(inputList);
    List<DisabilitySeries> femaleList = getFemaleList(inputList);
    List<charts.Series<DisabilitySeries, String>> chartSeries = _createChartData(maleList, femaleList);
    if(globals.barChart) {

      return GroupedBarChart.withExistingData(chartSeries);
    }
    else {
      DonutChart maleChart = DonutChart.withExistingData(maleList, "Hombres");
      return maleChart;
    }
  }

  void buildHelper(List<DisabilitySeries> inputList, String provinceName, String disabilityName){
    widgetList.add(
      Container(
          height: 520,    //Hardcoded :( This is for a 1080 x 1920 screen.
          padding: EdgeInsets.all(10),
          child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text("Población con discapacidad " + disabilityName + " en " + provinceName,
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Expanded(
                          child: chartTypeSelector(inputList) //CHART GOES HERE
                      )
                    ],
                  )
              )
          )
      ),
    );
  }

  static List<charts.Series<DisabilitySeries, String>> _createChartData(List<DisabilitySeries> maleList, List<DisabilitySeries> femaleList) {

    return [
      new charts.Series<DisabilitySeries, String>(
        id: 'Hombres',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DisabilitySeries amount, _) => amount.ageGroup,
        measureFn: (DisabilitySeries amount, _) => amount.amount,
        data: maleList,
      ),
      new charts.Series<DisabilitySeries, String>(
        id: 'Mujeres',
        colorFn: (_, __) => charts.MaterialPalette.pink.shadeDefault,
        domainFn: (DisabilitySeries amount, _) => amount.ageGroup,
        measureFn: (DisabilitySeries amount, _) => amount.amount,
        data: femaleList,
      ),
    ];
  }

  List<DisabilitySeries> getMaleList(List<DisabilitySeries> inputList){
    List<DisabilitySeries> outputList = new List<DisabilitySeries>();
    for (var item in inputList) {
      if(item.sex == "M")
        outputList.add(item);
    }
    return outputList;
  }

  List<DisabilitySeries> getFemaleList(List<DisabilitySeries> inputList){
    List<DisabilitySeries> outputList = new List<DisabilitySeries>();
    for (var item in inputList) {
      if(item.sex == "F")
        outputList.add(item);
    }
    return outputList;
  }

  Future<List<DataSeries>> getDataFromJSON(BuildContext context) async{
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/disabledPeopleCR.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f)=> DataSeries.fromJSON(f)).toList();
  }

  Future<void> buildUnfilteredList(BuildContext context) async{
    widgetList.clear();
    clearLists();

    if(unFilteredDataList.isEmpty)
      this.unFilteredDataList = await getDataFromJSON(context);
  }

  void buildDisabilityLists(){
    for (var item in unFilteredDataList) {
      eyeDisabilityList.add(DisabilitySeries("eyes", item.sex, item.age, item.province, item.eyeDisabled));
      earDisabilityList.add(DisabilitySeries("ears", item.sex, item.age, item.province, item.earDisabled));
      talkDisabilityList.add(DisabilitySeries("talk", item.sex, item.age, item.province, item.talkDisabled));
      walkDisabilityList.add(DisabilitySeries("walk", item.sex, item.age, item.province, item.walkDisabled));
      armDisabilityList.add(DisabilitySeries("arm", item.sex, item.age, item.province, item.armDisabled));
      intellectDisabilityList.add(DisabilitySeries("intel", item.sex, item.age, item.province, item.intellectDisabled));
      mentalDisabilityList.add(DisabilitySeries("mind", item.sex, item.age, item.province, item.mindDisabled));
    }
    print("Lists filled.");
  }

  void printData(){
    eyeDisabilityList.forEach((item) => print(item.toString()));
    earDisabilityList.forEach((item) => print(item.toString()));
    talkDisabilityList.forEach((item) => print(item.toString()));
    walkDisabilityList.forEach((item) => print(item.toString()));
    armDisabilityList.forEach((item) => print(item.toString()));
    intellectDisabilityList.forEach((item) => print(item.toString()));
    mentalDisabilityList.forEach((item) => print(item.toString()));
  }

  void clearLists(){
    eyeDisabilityList.clear();
    earDisabilityList.clear();
    talkDisabilityList.clear();
    walkDisabilityList.clear();
    armDisabilityList.clear();
    intellectDisabilityList.clear();
    mentalDisabilityList.clear();
  }

  void printUnfilteredList(){
    if(unFilteredDataList != null) {
      print("Printing unfiltered list");
      unFilteredDataList.forEach((item) => print(item.toString()));
    }
    else
      print("The unfiltered list is null.");
  }

  String getProvinceName(String inputString){
    switch (inputString) {
      case "SJ":
        {return "San José";}
        break;

      case "AL":
        {return "Alajuela";}
        break;

      case "CAR":
        {return("Cartago");}
        break;

      case "HER":
        {return("Heredia");}
        break;

      case "GUAN":
        {return("Guanacaste");}
        break;

      case "PUN":
        {return("Puntarenas");}
        break;

      case "LIM":
        {return("Limón");}
        break;

      default:
        {return("Invalid choice");}
        break;
    }
  }

  String getDisabilityName(String inputString){
    switch (inputString) {
      case "eyes":
        {return "ocular";}
        break;

      case "ears":
        {return "auditiva";}
        break;

      case "talk":
        {return("Cartago");}
        break;

      case "walk":
        {return("Heredia");}
        break;

      case "arms":
        {return("Guanacaste");}
        break;

      case "intellect":
        {return("Puntarenas");}
        break;

      case "Mental":
        {return("Limón");}
        break;

      default:
        {return("Invalid choice");}
        break;
    }
  }
}