import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_safe/Screens/home.dart';
import 'package:stay_safe/Screens/landing_page.dart';
import 'package:stay_safe/Screens/statistics.dart';
import 'package:stay_safe/State_Management/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterBloc>.value(
          value: CounterBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stay Safe',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Color.fromRGBO(73, 50, 155, 1.0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
