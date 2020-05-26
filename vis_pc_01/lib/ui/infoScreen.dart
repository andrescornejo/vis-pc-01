import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acerca de..."),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text("Aplicación hecha por Andrés Cornejo",
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    ),
    ]
    )
    );
  }

}