import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_safe/Screens/Widgets/decrement.dart';
import 'package:stay_safe/Screens/Widgets/increment.dart';
import 'package:stay_safe/State_Management/counter_bloc.dart';

class Prediction extends StatefulWidget {
  @override
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {

  
  var _countries = [
    "Nigeria",
    "China",
    "USA",
    "Ghana",
    "Qatar"
    "Japan",
    "Poland",
    "Korea",
    "India",
    "Cameroon"
    "Brazil",
    "Germany",
    "Ireland",
    "Italy",
    "France"
    "Argentina",
    "England",
    "Portuga",
    "Rwanda",
    "Serbia"
    "Slovakia",
    "Slovenia",
    "Somania",
    "South Africa",
    "Spain"
    "Sudan",
    "Sweeden",
    "Switzerland",
    "Thailand",
    "Tunisia"
    "Turkey",
    "Uganda",
    "Ukraine",
    "Uruguay",
    "Zambia"
  ];
  var _selectedCountry = 'Nigeria';

  @override
  Widget build(BuildContext context) {
    // CounterBloc counterBloc = Provider.of<CounterBloc>(context);
    // String counter = counterBloc.counter.toString();

    final List<double> covidCases = [
      15.3,
      11.15,
      10.02,
      11.21,
      13.83,
      14.16,
      14.30
    ];

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
                  Text(
                    "Prediction",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 35.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text("Country"),
                        items: _countries.map((country) {
                          return DropdownMenuItem<String>(
                            value: country,
                            child: Text(country, style: TextStyle()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            this._selectedCountry = value;
                          });
                        },
                        value: _selectedCountry,
                      ),
                    ),
                  )
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
                  color: Colors.white),
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
                          'Our Machine Learning Algorithm predicts that there is a chance of:',
                          style: const TextStyle(
                            fontSize: 20.0,
                            // fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                            letterSpacing: 1
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          '10896',
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            letterSpacing: 1
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'cases on 24/08/2020',
                          style: const TextStyle(
                            fontSize: 20.0,
                            // fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                            letterSpacing: 1
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: Color.fromRGBO(73, 50, 155, 1.0),
                            splashColor: Color.fromRGBO(237, 231, 255, 1.0),
                            onPressed: (){},
                            child: Text("See more", style: TextStyle(color: Colors.white, fontSize: 20),)),
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
