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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double bmi = weight / (height * height);

      if (bmi < 18.5) {
        _infoText = "Underweight (${bmi.toStringAsPrecision(3)})";
      } else if (bmi >= 18.5 && bmi < 25) {
        _infoText = "Normal Weight (${bmi.toStringAsPrecision(3)})";
      } else if (bmi >= 25 && bmi < 30) {
        _infoText = "Overweight (${bmi.toStringAsPrecision(3)})";
      } else if (bmi >= 30 && bmi < 35) {
        _infoText = "Obese Class I (${bmi.toStringAsPrecision(3)})";
      } else if (bmi >= 35 && bmi < 40) {
        _infoText = "Obese Class II (${bmi.toStringAsPrecision(3)})";
      } else if (bmi > 40) {
        _infoText = "Obese Class III (${bmi.toStringAsPrecision(3)})";
      }
    });
  }

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
            onPressed: () {
              _resetFields();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline,
                  size: 120.0, color: Colors.deepPurple[800]),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Weight (Kg)",
                    labelStyle: TextStyle(color: Colors.deepPurple[800])),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple[800], fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insert your weight";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Height (cm)",
                    labelStyle: TextStyle(color: Colors.deepPurple[800])),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple[800], fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insert your height";
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.deepPurple[800],
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple[800], fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
