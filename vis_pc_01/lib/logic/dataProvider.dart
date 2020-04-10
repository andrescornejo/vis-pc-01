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
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vispc01/charts/scatterPlotChart.dart';
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
    rebuildDisabilityLists(context);
    masterFilter();
    printData();
    buildHelper();
    return Column(
      children: widgetList,
    );
//    return Text("penis");
  }

  void buildHelper(){
    widgetList.clear();
    widgetList.add(Container(
        height: 520,    //Hardcoded :( This is for a 1080 x 1920 screen.
        padding: EdgeInsets.all(10),
        child: Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text("Visualización: Población con discapacidad en Costa Rica",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Expanded(
                        child: ShapesScatterPlotChart.withSampleData() //CHART GOES HERE
                    )
                  ],
                )
            )
        )
    ),);
  }

  Container chartBuilder(){

  }

  /* The master filter

   */
  void masterFilter(){
    if(globals.disblEYES)
      filterList(eyeDisabilityList);
    else
      eyeDisabilityList.clear();
    if(globals.disblEARS)
      filterList(earDisabilityList);
    else
      earDisabilityList.clear();
    if(globals.disblTALK)
      filterList(talkDisabilityList);
    else
      talkDisabilityList.clear();
    if(globals.disblMIND)
      filterList(mentalDisabilityList);
    else
      mentalDisabilityList.clear();

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

  void removeFromList(List<DisabilitySeries> inputList, String toRemove){

  }

  Future<List<DataSeries>> getDataFromJSON(BuildContext context) async{
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/disabledPeopleCR.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f)=> DataSeries.fromJSON(f)).toList();
  }

  void buildDisabilityLists(BuildContext context) async{
    if(unFilteredDataList.isEmpty)
      this.unFilteredDataList = await getDataFromJSON(context);

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

  void rebuildDisabilityLists(BuildContext context){
    clearLists();
    buildDisabilityLists(context);
  }

  void printData(){
    print("People with eye disability: ");
    eyeDisabilityList.forEach((item) => print(item.toString()));
//    earDisabilityList.forEach((item) => print(item.toString()));
//    talkDisabilityList.forEach((item) => print(item.toString()));
//    walkDisabilityList.forEach((item) => print(item.toString()));
//    armDisabilityList.forEach((item) => print(item.toString()));
//    intellectDisabilityList.forEach((item) => print(item.toString()));
//    mentalDisabilityList.forEach((item) => print(item.toString()));
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

}