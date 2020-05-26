import 'package:flutter/material.dart';
import 'package:vispc01/logic/dataSeries.dart';
import 'package:vispc01/logic/dataProvider.dart';
import 'package:vispc01/ui/dataFilterUI.dart';
import 'package:vispc01/ui/infoScreen.dart';

import 'package:vispc01/charts/scatterPlotChart.dart';
import 'dart:convert';

import 'chartTypeSelector.dart';



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
        title: Text("Población con discapacidad en CR"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  DataProvider(),
                ],
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChartTypeSelector())
                  );
                },
                child: Icon(Icons.insert_chart),
                disabledColor: Colors.lightBlue[600],
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InfoScreen())
                  );
                },
                child: Icon(Icons.info),
                disabledColor: Colors.lightBlue[600],
              ),
            ],
          )
        ],
      )
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







//Divider(),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            FlatButton(
//              onPressed: () {
//                Navigator.push(context,
//                MaterialPageRoute(builder: (context) => DataFilterUI())
//                );
//              },
//              child: Icon(Icons.filter_list),
//              disabledColor: Colors.lightBlue[600],
//            ),
//            FlatButton(
//              onPressed: () {},
//              child: Icon(Icons.insert_chart),
//              disabledColor: Colors.lightBlue[600],
//            ),
//            FlatButton(
//              onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => InfoScreen())
//                );
//              },
//              child: Icon(Icons.info),
//              disabledColor: Colors.lightBlue[600],
//            ),
//          ],
//        )

}