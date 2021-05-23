import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    _search == null
        ? response = await http.get(
            "https://api.giphy.com/v1/gifs/trending?api_key=0wjGKFf8LJWGDHaainPqMNAMCuKoB2or&limit=20&rating=g")
        : response = await http.get(
            "https://api.giphy.com/v1/gifs/search?api_key=0wjGKFf8LJWGDHaainPqMNAMCuKoB2or&q=$_search&limit=20&offset=$_offset&rating=g&lang=en");

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map); //checking if get method has results
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
