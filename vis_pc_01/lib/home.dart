import 'package:flutter/material.dart';
import 'package:vispc01/dataSeries.dart';
import 'package:vispc01/dataFilterUI.dart';
import 'package:vispc01/infoScreenUI.dart';

import 'package:vispc01/bubble.dart';
import 'dart:convert';



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
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(children: <Widget>[
        Container(
          height: 539,    //Hardcoded :( This is for a 1080 x 1920 screen.
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
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => DataFilterUI())
                );
              },
              child: Icon(Icons.filter_list),
              disabledColor: Colors.lightBlue[600],
            ),
            FlatButton(
              onPressed: () {},
              child: Icon(Icons.insert_chart),
              disabledColor: Colors.lightBlue[600],
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoScreenUI())
                );
              },
              child: Icon(Icons.info),
              disabledColor: Colors.lightBlue[600],
            ),
          ],
        )
      ],)
    );
  }

//  @override
//  Widget build(BuildContext context){
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("Data Parser"),
//        ),
//        body: Container(
//            child: FutureBuilder(
//                future: getDataFromJSON(context),
//                builder: (context,data){
//                  if(data.hasData){
//                    List<DataSeries> dataList = data.data;
//                    return ListView.builder(
//                        itemCount: dataList.length,
//                        itemBuilder: (context, index){
//                          return ListTile(
//                            title: Text(dataList[index].age, style: TextStyle(
//                                fontSize: 25.0,
//                                fontWeight: FontWeight.bold
//                            ),),
//                            subtitle: Text(dataList[index].province),
//                          );
//                        });
//                  } else {
//                    return Center(child: CircularProgressIndicator(),);
//                  }
//                }
//            )
//        )
//    );
//  }

}