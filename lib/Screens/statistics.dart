import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stay_safe/Screens/Widgets/decrement.dart';
import 'package:stay_safe/Screens/Widgets/increment.dart';
import 'package:stay_safe/State_Management/counter_bloc.dart';

class Statistics extends StatefulWidget {

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
  Statistics(
    this.newConfirmed,
    this.totalConfirmed,
    this.newRecovered,
    this.totalRecovered,
    this.totalDeaths,
    this.newConfirmed2,
    this.totalConfirmed2,
    this.newRecovered2,
    this.totalRecovered2,
    this.totalDeaths2
  );
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    // CounterBloc counterBloc = Provider.of(context);
    // String affected = counterBloc.affected.toString();
    // String death = counterBloc.death.toString();
    // String recovered = counterBloc.recovered.toString();
    // String active = counterBloc.active.toString();
    // String serious = counterBloc.serious.toString();

    int count = 0;

    // String newConfirmed = counterBloc.newConfirmed.toString();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final List<double> covidCases = [11.32, 11.32, 11.21, 11.21, 13.83, 14.16, 14.30];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20.0),
        //     child: GestureDetector(
        //       child: Container(
        //         color: Colors.transparent,
        //         child: Icon(Icons.notifications_none)),
        //       onTap: () {
        //         try {
        //           Fluttertoast.showToast(
        //             msg: "No notification.",
        //             toastLength: Toast.LENGTH_SHORT,
        //             backgroundColor: Color.fromRGBO(142, 106, 255, 0.7)
        //           );
        //         } catch (e) {
        //           print(e.toString());
        //         }
        //       },
        //     ),
        //   )
        // ],
      ),
      backgroundColor: Color.fromRGBO(73, 50, 155, 1.0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Statistics",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.0),
            DefaultTabController(
              length: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TabBar(
                  indicator: BubbleTabIndicator(
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    indicatorHeight: 40.0,
                    indicatorColor: Colors.white,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  tabs: <Widget>[
                    Text('My Country'),
                    Text('Global'),
                  ],
                  onTap: (index) {
                    if (index == 0) {
                      setState(() {
                        count = 0;
                        print("${widget.newConfirmed} My Country");
                      });
                    } else {
                      setState(() {
                        count = 1;
                        print("${widget.newConfirmed2} Global");
                      });
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: height / 6.4,
                          width: width / 2.4,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("New Confirmed",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w600)),
                                Text(count == 0 ? "${widget.newConfirmed} country" : "${widget.newConfirmed2} global",
                                  style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: height / 6.4,
                          width: width / 2.4,
                          decoration: BoxDecoration(
                              color: Colors.amber[700],
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Total Confirmed",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w600)),
                                Text("${widget.totalConfirmed}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: height / 6.4,
                          width: width / 3.8,
                          decoration: BoxDecoration(
                              color: Colors.cyan[300],
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("New Recovered",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w600)),
                                Text("${widget.newRecovered}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: height / 6.4,
                          width: width / 3.8,
                          decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Total Recovered",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w600)),
                                Text("${widget.totalRecovered}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: height / 6.4,
                          width: width / 3.8,
                          decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Total Death",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w600)),
                                Text("${widget.totalDeaths}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: 280.0,
              padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0)),
                  color: Colors.white),
              child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Daily New Cases',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(73, 50, 155, 1.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 16.0,
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            margin: 10.0,
                            showTitles: true,
                            textStyle: TextStyle(
                              color: Color.fromRGBO(73, 50, 155, 1.0),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                            rotateAngle: 35.0,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'May 24';
                                case 1:
                                  return 'May 25';
                                case 2:
                                  return 'May 26';
                                case 3:
                                  return 'May 27';
                                case 4:
                                  return 'May 28';
                                case 5:
                                  return 'May 29';
                                case 6:
                                  return 'May 30';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(
                              margin: 10.0,
                              showTitles: true,
                              textStyle: TextStyle(
                                color: Color.fromRGBO(73, 50, 155, 1.0),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                              getTitles: (value) {
                                if (value == 0) {
                                  return '0';
                                } else if (value % 3 == 0) {
                                  return '${value ~/ 3 * 5}K';
                                }
                                return '';
                              }),
                        ),
                        gridData: FlGridData(
                          show: true,
                          checkToShowHorizontalLine: (value) => value % 3 == 0,
                          getDrawingHorizontalLine: (value) => FlLine(
                            color: Colors.black12,
                            strokeWidth: 1.0,
                            dashArray: [5],
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups: covidCases
                            .asMap()
                            .map((key, value) => MapEntry(
                                key,
                                BarChartGroupData(
                                  x: key,
                                  barRods: [
                                    BarChartRodData(
                                      y: value,
                                      color: Colors.red,
                                    ),
                                  ],
                                )))
                            .values
                            .toList(),
                      ),
                    ),
                  ),

                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
