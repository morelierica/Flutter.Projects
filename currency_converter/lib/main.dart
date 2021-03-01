import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=6cf64cac";

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.teal[700],
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal[700])),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal[100])),
          hintStyle: TextStyle(color: Colors.teal[700]),
        )),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dollar;
  double euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("\$ Currency Converter \$"),
          backgroundColor: Colors.teal[700],
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Text(
                      "Loading...",
                      style: TextStyle(color: Colors.teal[700], fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error loading data",
                        style:
                            TextStyle(color: Colors.teal[700], fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    dollar =
                        snapshot.data["results"]["currencies"]["USD"]["buy"];
                    euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                    return SingleChildScrollView(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Icon(Icons.monetization_on,
                              size: 150.0, color: Colors.teal[700]),
                          TextField(
                            decoration: InputDecoration(
                                labelText: "Reais",
                                labelStyle: TextStyle(color: Colors.teal[700]),
                                border: OutlineInputBorder(),
                                prefixText: "R\$ "),
                            style: TextStyle(
                                color: Colors.teal[700], fontSize: 25.0),
                          ),
                          Divider(),
                          TextField(
                            decoration: InputDecoration(
                                labelText: "Dollars",
                                labelStyle: TextStyle(color: Colors.teal[700]),
                                border: OutlineInputBorder(),
                                prefixText: "US\$ "),
                            style: TextStyle(
                                color: Colors.teal[700], fontSize: 25.0),
                          ),
                          Divider(),
                          TextField(
                            decoration: InputDecoration(
                                labelText: "Euros",
                                labelStyle: TextStyle(color: Colors.teal[700]),
                                border: OutlineInputBorder(),
                                prefixText: "€ "),
                            style: TextStyle(
                                color: Colors.teal[700], fontSize: 25.0),
                          )
                        ],
                      ),
                    );
                  }
              }
            }));
  }
}
