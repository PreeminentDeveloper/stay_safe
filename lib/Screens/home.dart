import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stay_safe/Screens/Service/covid.dart';
import 'package:stay_safe/Screens/Service/recent_covid_cases.dart';
import 'package:stay_safe/Screens/Shared/symptoms.dart';
import 'package:stay_safe/Screens/predictions.dart';
import 'package:stay_safe/Screens/statistics.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  int newConfirmed;
  int totalConfirmed;
  int newRecovered;
  int totalRecovered;
  int totalDeaths;

  int newConfirmed2;
  int totalConfirmed2;
  int newRecovered2;
  int totalRecovered2;
  int totalDeaths2;

  Covid covid = Covid();

  @override
  void initState() {
    super.initState();
    _getCovidData();
    // _getCovidCases();
  }

  void _getCovidCases() async {
    await covid.getCases();
  }

  void _getCovidData() async {
    await covid.getResults();
    setState(() {
      newConfirmed = covid.newConfirmed;
      totalConfirmed = covid.totalConfirmed;
      newRecovered = covid.newRecovered;
      totalRecovered = covid.totalRecovered;
      totalDeaths = covid.totalDeaths;

      newConfirmed2 = covid.newConfirmed2;
      totalConfirmed2 = covid.totalConfirmed2;
      newRecovered2 = covid.newRecovered2;
      totalRecovered2 = covid.totalRecovered2;
      totalDeaths2 = covid.totalDeaths2;
    });
  }

  List<Symptoms> symptoms = [
    Symptoms(name: "Dry Cough", image: "lib/Images/dry_cough.jpg"),
    Symptoms(name: "Fever", image: "lib/Images/fever2.jpg"),
    Symptoms(name: "Shortness of Breath", image: "lib/Images/shortness_of_breath.jpg"),
    Symptoms(name: "Tiredness", image: "lib/Images/tiredness1.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    print("Country = $newConfirmed");
    print("Global = $newConfirmed2");
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(73, 50, 155, 1.0),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Color.fromRGBO(237, 231, 255, 1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 17.0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(73, 50, 155, 1.0),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Stay Safe",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          Container(
                            height: 35.0,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(237, 231, 255, 1.0),),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 12.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('lib/Images/nig2.png'), fit: BoxFit.fill)
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text("Nigeria", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                              ],
                            )
                          )
                        ],
                      ),
                      SizedBox(
                        height: height / 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "You need a guide?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                          SizedBox(height: height / 64),
                          Text(
                            "You can get some valid informations within your location to reduce your risk of infection.",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 15.0),
                          ),
                          SizedBox(height: height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 20.0,
                                ),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Statistics(newConfirmed, totalConfirmed, newRecovered, totalRecovered, totalDeaths, newConfirmed2, totalConfirmed2, newRecovered2, totalRecovered2, totalDeaths2,))),
                                color: Colors.red[400],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text(
                                  'Check Statistics',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                textColor: Colors.white,
                              ),
                              FlatButton(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 20.0,
                                ),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Prediction())),
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text('Check Prediction',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: Text("Symptoms",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                    SizedBox(height: height / 128),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Signs and symptoms of COVID-19 may appear 2 to 14 days after exposure. This time after exposure and before having symptoms is called the incubation period. Common signs and symptoms can include:",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    // SizedBox(height: height / 128),
                    Container(
                      height: 250.0,
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 15, bottom: 35, left: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: symptoms.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Container(
                                height: 400,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "${symptoms[index].image}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${symptoms[index].name}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
