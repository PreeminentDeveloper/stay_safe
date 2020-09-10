import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
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
      //   builder: (context, widget) => ResponsiveWrapper.builder(
      //   widget,
      //   maxWidth: 1200,
      //   minWidth: 480,
      //   defaultScale: true,
      //   breakpoints: [
      //     ResponsiveBreakpoint.resize(480, name: MOBILE),
      //     ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //     ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      //   ],
      // ),
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
