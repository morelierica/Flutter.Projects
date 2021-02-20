import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline,
              size: 120.0, color: Colors.deepPurple[800]),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Weight (Kg)",
              labelStyle: TextStyle(
                color: Colors.deepPurple[800],
              ),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepPurple[800], fontSize: 25.0),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Height (cm)",
              labelStyle: TextStyle(
                color: Colors.deepPurple[800],
              ),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepPurple[800], fontSize: 25.0),
          )
        ],
      ),
    );
  }
}
