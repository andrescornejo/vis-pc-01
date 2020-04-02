import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vispc01/dataSeries.dart';

import 'package:vispc01/bubble.dart';

class HomePage extends StatelessWidget {

  Future<List<DataSeries>> getDataFromJSON(BuildContext context) async{
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/disabledPeopleCR.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f)=> DataSeries.fromJSON(f)).toList();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false

      appBar: AppBar(
        title: Text("vis-pc-01"),
      ),
      body: Column(children: <Widget>[
        Container(
          height: 539,
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
                      child: ShapesScatterPlotChart() //CHART GOES HERE
                  )
                ],
              )
            )
          )
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Icon(Icons.filter_list),
              disabledColor: Colors.lightBlue[600],
            ),
            FlatButton(
              onPressed: () {},
              child: Icon(Icons.insert_chart),
              disabledColor: Colors.lightBlue[600],
            ),
            FlatButton(
              onPressed: () {},
              child: Icon(Icons.info),
              disabledColor: Colors.lightBlue[600],
            ),
          ],
        )
      ],)
    );
  }
}