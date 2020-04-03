import 'package:flutter/material.dart';
import 'package:vispc01/globals.dart' as globals;

class DataFilter extends StatefulWidget {
  @override
  DataFilterState createState() => new DataFilterState();
}

class DataFilterState extends State<DataFilter>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtro de variables"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: <Widget>[

          //SEX FILTER
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Filtrar por sexo",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          CheckboxListTile(
            title: Text('Hombre'),
            value: globals.sexM,
            onChanged: (bool newValue) {
              setState(() {globals.sexM = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Mujer'),
            value: globals.sexF,
            onChanged: (bool newValue) {
              setState(() {globals.sexF = newValue;});
            },
          ),
          Divider(),


          //PROVINCE FILTER
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Filtrar por provincias",
                style: TextStyle(
                    fontSize: 25.0,
                ),
              ),
          ),
          CheckboxListTile(
            title: Text('San José'),
            value: globals.provSJ,
            onChanged: (bool newValue) {
              setState(() {globals.provSJ = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Alajuela'),
            value: globals.provAL,
            onChanged: (bool newValue) {
              setState(() {globals.provAL = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Cartago'),
            value: globals.provCAR,
            onChanged: (bool newValue) {
              setState(() {globals.provCAR = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Heredia'),
            value: globals.provHER,
            onChanged: (bool newValue) {
              setState(() {globals.provHER = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Guanacaste'),
            value: globals.provGUAN,
            onChanged: (bool newValue) {
              setState(() {globals.provGUAN = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Puntarenas'),
            value: globals.provPUN,
            onChanged: (bool newValue) {
              setState(() {globals.provPUN= newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Limón'),
            value: globals.provLIM,
            onChanged: (bool newValue) {
              setState(() {globals.provLIM = newValue;});
            },
          ),
          Divider(),


          //DISABILITY FILTER
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Filtrar por discapacidades",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          CheckboxListTile(
            title: Text('Para ver, aún con lentes puestos'),
            value: globals.disblEYES,
            onChanged: (bool newValue) {
              setState(() {globals.disblEYES = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Para oir'),
            value: globals.disblEARS,
            onChanged: (bool newValue) {
              setState(() {globals.disblEARS = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Para hablar'),
            value: globals.disblTALK,
            onChanged: (bool newValue) {
              setState(() {globals.disblTALK = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Para caminar'),
            value: globals.disblWALK,
            onChanged: (bool newValue) {
              setState(() {globals.disblWALK = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Para utilizar brazos o manos'),
            value: globals.disblARMS,
            onChanged: (bool newValue) {
              setState(() {globals.disblARMS = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Del tipo intelectual'),
            value: globals.disblINTEL,
            onChanged: (bool newValue) {
              setState(() {globals.disblINTEL = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('Del tipo mental'),
            value: globals.disblMIND,
            onChanged: (bool newValue) {
              setState(() {globals.disblMIND = newValue;});
            },
          ),


          //AGE GROUP FILTER
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Filtrar por discapacidades",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ]
      ),

    );
  }

  String checkBool(bool input){ //debug function since I can't just print booleans, like in C.
    if(input) return "true";
    else return "false";
  }
}

