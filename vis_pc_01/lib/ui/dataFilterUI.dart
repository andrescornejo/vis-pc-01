import 'package:flutter/material.dart';
import 'package:vispc01/libraries/globals.dart' as globals;

class DataFilterUI extends StatefulWidget {
  @override
  DataFilterUIState createState() => new DataFilterUIState();
}

class DataFilterUIState extends State<DataFilterUI>{

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
          Divider(),


          //AGE GROUP FILTER
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Filtrar por grupos de edad",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          CheckboxListTile(
            title: Text('De 0 a 14 años'),
            value: globals.age0to14,
            onChanged: (bool newValue) {
              setState(() {globals.age0to14 = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('De 15 a 34 años'),
            value: globals.age15to34,
            onChanged: (bool newValue) {
              setState(() {globals.age15to34 = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('De 35 a 54 años'),
            value: globals.age35to54,
            onChanged: (bool newValue) {
              setState(() {globals.age35to54 = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('De 55 a 74 años'),
            value: globals.age55to74,
            onChanged: (bool newValue) {
              setState(() {globals.age55to74 = newValue;});
            },
          ),
          CheckboxListTile(
            title: Text('De 75 años en adelante'),
            value: globals.age75plus,
            onChanged: (bool newValue) {
              setState(() {globals.age75plus = newValue;});
            },
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

