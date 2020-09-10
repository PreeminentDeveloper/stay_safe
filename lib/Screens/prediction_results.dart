import 'package:flutter/material.dart';
import 'package:stay_safe/Screens/Service/covid.dart';
import 'package:stay_safe/Screens/Service/predicted_cases.dart';

class PredictionResults extends StatefulWidget {

  final String selectedCountry;
  PredictionResults(this.selectedCountry);
  
  @override
  _PredictionResults createState() => _PredictionResults();
}

class _PredictionResults extends State<PredictionResults> {
  Covid covid;

  String formatDateTime(DateTime dateTime){
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    covid = Covid(countryCode: widget.selectedCountry);
    print(widget.selectedCountry);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Predicted Results"),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(73, 50, 155, 1.0),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder(
            future: covid.getPrediction(),
            builder: (BuildContext context,
                AsyncSnapshot<List<PredictedCases>> snapshot) {
              if (snapshot.hasData) {
                List<PredictedCases> predictions = snapshot.data;
                return ListView(
                    children: predictions
                        .map((PredictedCases prediction) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          color: Color.fromRGBO(237, 231, 255, 1.0),
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("${prediction.cases.toString()}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                                    Text(" cases", style: TextStyle()),
                                  ],
                                ),
                                subtitle: Text("${prediction.date}", style: TextStyle()),
                                leading: CircleAvatar(
                                  child: Text(widget.selectedCountry.toUpperCase(), style: TextStyle()),
                                  backgroundColor: Color.fromRGBO(73, 50, 155, 1.0),
                                ),
                                trailing: Container(
                                  width: 55,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage("lib/Images/covid19.jpg"),),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                          ),
                        )
                        .toList());
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
