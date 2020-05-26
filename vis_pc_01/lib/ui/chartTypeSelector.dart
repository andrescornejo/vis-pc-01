import 'package:flutter/material.dart';
import 'package:vispc01/libraries/globals.dart' as globals;

class ChartTypeSelector extends StatefulWidget {
  State createState() => new ChartTypeState();
}

class ChartTypeState extends State<ChartTypeSelector>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.arrow_back), onPressed: ()async{
        print("goneback");
        Navigator.pop(context);
        }),
        title: new Text('Filtro de variables'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
              child: Text("Tipo de Gráfico",
                style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          CheckboxListTile(
            title: Text('Gráfico de barras'),
            value: globals.barChart,
            onChanged: (bool newValue) {
            setState(() {globals.barChart = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Gráfico de dona'),
            value: globals.chartDonut,
            onChanged: (bool newValue) {
            setState(() {globals.chartDonut = newValue;});
            },
          ),
      ]
      )
    );
  }
}