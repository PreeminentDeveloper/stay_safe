import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_safe/Screens/Service/countries.dart';
import 'package:stay_safe/Screens/Service/covid.dart';
import 'package:stay_safe/Screens/Service/predicted_cases.dart';
import 'package:stay_safe/Screens/Widgets/decrement.dart';
import 'package:stay_safe/Screens/Widgets/increment.dart';
import 'package:stay_safe/Screens/prediction_results.dart';
import 'package:stay_safe/State_Management/counter_bloc.dart';

class Prediction extends StatefulWidget {
  @override
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  final Covid covid = Covid();

  List _countries = [];
  String _selectedCountry = 'NG';

  @override
  Widget build(BuildContext context) {
    // CounterBloc counterBloc = Provider.of<CounterBloc>(context);
    // String counter = counterBloc.counter.toString();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: Color.fromRGBO(73, 50, 155, 1.0),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Prediction",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 35.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: FutureBuilder(
                          future: covid.getCountries(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Countries>> snapshot) {
                            if (snapshot.hasData) {
                              List<Countries> countries2 = snapshot.data;
                            return DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  hint: Text("Country"),
                                  items: countries2.map((country) {
                                      // print(country.acronym);
                                    return DropdownMenuItem<String>(
                                      child: Text(country.countryName),
                                      value: country.acronym,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      _selectedCountry = value;
                                    });
                                  },
                                  value: _selectedCountry,
                                ),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Loading..."),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Color.fromRGBO(237, 231, 255, 1.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('lib/Images/ml.png'),
                          height: 120,
                        ),
                        Text(
                          'Our Machine Learning Algorithm predicts that there will be chances of Corona virus cases in the selected country above.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(73, 50, 155, 1.0),
                              letterSpacing: 1),
                        ),
                        SizedBox(height: 60.0),
                        Text(
                          '14days result of predicted cases:',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(73, 50, 155, 1.0),
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              color: Color.fromRGBO(73, 50, 155, 1.0),
                              splashColor: Color.fromRGBO(197, 191, 255, 1.0),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PredictionResults(_selectedCountry)
                                          )),
                              child: Text(
                                "See results",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
