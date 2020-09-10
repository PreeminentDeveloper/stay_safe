import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stay_safe/Screens/Service/countries.dart';
import 'package:stay_safe/Screens/Service/covid.dart';
import 'package:stay_safe/Screens/Service/recent_covid_cases.dart';
import 'package:stay_safe/Screens/Widgets/decrement.dart';
import 'package:stay_safe/Screens/Widgets/increment.dart';
import 'package:stay_safe/State_Management/counter_bloc.dart';

class Statistics extends StatefulWidget {
  Covid covid;

  Statistics(this.covid);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int count = 0;

  String formatDateTime(DateTime dateTime){
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // CounterBloc counterBloc = Provider.of(context);
    // String affected = counterBloc.affected.toString();
    // String death = counterBloc.death.toString();
    // String recovered = counterBloc.recovered.toString();
    // String active = counterBloc.active.toString();
    // String serious = counterBloc.serious.toString();

    // String newConfirmed = counterBloc.newConfirmed.toString();

    var orientation = MediaQuery.of(context).orientation;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // // divide cases by 7,000 to get the value (e.g 53317/7000 = 7.62)
    final List<double> covidCases = [7.42, 7.46, 7.51, 7.543, 7.57, 7.62, 7.62];

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
            SizedBox(
                height: orientation == Orientation.portrait
                    ? width / 36
                    : height / 36),
            DefaultTabController(
              length: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: 50,
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
                      });
                    } else {
                      setState(() {
                        count = 1;
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
                          height: orientation == Orientation.portrait
                              ? height / 6.4
                              : width / 6.4,
                          width: orientation == Orientation.portrait
                              ? width / 2.4
                              : height / 2.4,
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
                                Text(
                                    count == 0 &&
                                            (widget.covid.newConfirmed) != null
                                        ? "${widget.covid.newConfirmed}"
                                        : count != 0 &&
                                                (widget.covid.newConfirmed2) !=
                                                    null
                                            ? "${widget.covid.newConfirmed2}"
                                            : "Loading...",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: orientation == Orientation.portrait
                              ? height / 6.4
                              : width / 6.4,
                          width: orientation == Orientation.portrait
                              ? width / 2.4
                              : height / 2.4,
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
                                Text(
                                    count == 0 &&
                                            (widget.covid.totalConfirmed) !=
                                                null
                                        ? "${widget.covid.totalConfirmed}"
                                        : count != 0 &&
                                                (widget.covid
                                                        .totalConfirmed2) !=
                                                    null
                                            ? "${widget.covid.totalConfirmed2}"
                                            : "Loading...",
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
                      height: orientation == Orientation.portrait
                          ? height / 32
                          : width / 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: orientation == Orientation.portrait
                              ? height / 6.4
                              : width / 6.4,
                          width: orientation == Orientation.portrait
                              ? width / 3.8
                              : height / 3.8,
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
                                Text(
                                    count == 0 &&
                                            (widget.covid.newRecovered) != null
                                        ? "${widget.covid.newRecovered}"
                                        : count != 0 &&
                                                (widget.covid.newRecovered2) !=
                                                    null
                                            ? "${widget.covid.newRecovered2}"
                                            : "Loading...",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: orientation == Orientation.portrait
                              ? height / 6.4
                              : width / 6.4,
                          width: orientation == Orientation.portrait
                              ? width / 3.8
                              : height / 3.8,
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
                                Text(
                                    count == 0 &&
                                            (widget.covid.totalRecovered) !=
                                                null
                                        ? "${widget.covid.totalRecovered}"
                                        : count != 0 &&
                                                (widget.covid
                                                        .totalRecovered2) !=
                                                    null
                                            ? "${widget.covid.totalRecovered2}"
                                            : "Loading...",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: orientation == Orientation.portrait
                              ? height / 6.4
                              : width / 6.4,
                          width: orientation == Orientation.portrait
                              ? width / 3.8
                              : height / 3.8,
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
                                Text(
                                    count == 0 &&
                                            (widget.covid.totalDeaths) != null
                                        ? "${widget.covid.totalDeaths}"
                                        : count != 0 &&
                                                (widget.covid.totalDeaths2) !=
                                                    null
                                            ? "${widget.covid.totalDeaths2}"
                                            : "Loading...",
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
              // color: Colors.white,
              height: 170,
              child: FutureBuilder(
                future: widget.covid.getCases(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<RecentCovidCases>> snapshot) {
                  if (snapshot.hasData) {
                    List<RecentCovidCases> cases = snapshot.data;
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.easeInOutCirc,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: cases
                          .map((RecentCovidCases rCase) => Builder(
                                builder: (BuildContext context) => Card(
                                  color: Color.fromRGBO(237, 231, 255, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Timeline - NG", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                                        SizedBox(height: 10),
                                        Text(formatDateTime(DateTime.parse(rCase.date))),
                                        SizedBox(height: 20),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Cases: ",
                                                style: TextStyle(color: Colors.black)
                                              ),
                                              TextSpan(
                                                text: "${rCase.cases}",
                                                style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)
                                              )
                                            ]
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Deaths: ",
                                                style: TextStyle(color: Colors.black)
                                              ),
                                              TextSpan(
                                                text: "${rCase.deaths}",
                                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                                              )
                                            ]
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Recovered: ",
                                                style: TextStyle(color: Colors.black)
                                              ),
                                              TextSpan(
                                                text: "${rCase.recovered}",
                                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)
                                              )
                                            ]
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )

            // Container(
            //   height: orientation == Orientation.portrait ? height / 2.29 : width / 2.29,
            //   padding: EdgeInsets.only(bottom: 30),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(25.0),
            //           topRight: Radius.circular(25.0)),
            //       color: Colors.white),
            //   child: Column(
            //   children: <Widget>[
            //     Container(
            //       padding: const EdgeInsets.all(20.0),
            //       alignment: Alignment.centerLeft,
            //       child: Text(
            //         'Daily New Cases',
            //         style: const TextStyle(
            //           fontSize: 20.0,
            //           fontWeight: FontWeight.bold,
            //           color: Color.fromRGBO(73, 50, 155, 1.0),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         width: width / 1.18,
            //         child: BarChart(
            //           BarChartData(
            //             alignment: BarChartAlignment.spaceAround,
            //             maxY: 16.0,
            //             barTouchData: BarTouchData(enabled: false),
            //             titlesData: FlTitlesData(
            //               show: true,
            //               bottomTitles: SideTitles(
            //                 margin: 10.0,
            //                 showTitles: true,
            //                 textStyle: TextStyle(
            //                   color: Color.fromRGBO(73, 50, 155, 1.0),
            //                   fontSize: 14.0,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //                 rotateAngle: 35.0,
            //                 getTitles: (double value) {
            //                   switch (value.toInt()) {
            //                     case 0:
            //                       return 'Aug 22';
            //                     case 1:
            //                       return 'Aug 23';
            //                     case 2:
            //                       return 'Aug 24';
            //                     case 3:
            //                       return 'Aug 25';
            //                     case 4:
            //                       return 'Aug 26';
            //                     case 5:
            //                       return 'Aug 27';
            //                     case 6:
            //                       return 'Aug 28';
            //                     default:
            //                       return '';
            //                   }
            //                 },
            //               ),
            //               leftTitles: SideTitles(
            //                   margin: 10.0,
            //                   showTitles: true,
            //                   textStyle: TextStyle(
            //                     color: Color.fromRGBO(73, 50, 155, 1.0),
            //                     fontSize: 14.0,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                   getTitles: (value) {
            //                     if (value == 0) {
            //                       return '0';
            //                     } else if (value % 3 == 0) {
            //                       return '${value ~/ 3 * 2}K';
            //                     }
            //                     return '';
            //                   }),
            //             ),
            //             gridData: FlGridData(
            //               show: true,
            //               checkToShowHorizontalLine: (value) => value % 3 == 0,
            //               getDrawingHorizontalLine: (value) => FlLine(
            //                 color: Colors.black12,
            //                 strokeWidth: 1.0,
            //                 dashArray: [5],
            //               ),
            //             ),
            //             borderData: FlBorderData(show: false),
            //             barGroups: covidCases
            //                 .asMap()
            //                 .map((key, value) => MapEntry(
            //                     key,
            //                     BarChartGroupData(
            //                       x: key,
            //                       barRods: [
            //                         BarChartRodData(
            //                           y: value,
            //                           color: Colors.red,
            //                         ),
            //                       ],
            //                     )))
            //                 .values
            //                 .toList(),
            //           ),
            //         ),
            //       ),

            //     ),
            //   ],
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
