import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vispc01/dataSeries.dart';

class HomePage extends StatelessWidget {

  Future<List<DataSeries>> getDataFromJSON(BuildContext context) async{
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/disabledPeopleCR.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f)=> DataSeries.fromJSON(f)).toList();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Parser"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getDataFromJSON(context),
          builder: (context,data){
            if(data.hasData){
              List<DataSeries> dataList = data.data;
              return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(dataList[index].age, style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),),
                      subtitle: Text(dataList[index].talkDisabled),
                    );
              });
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          }
        )  
      )
    );
  }
}