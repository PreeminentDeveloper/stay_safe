import 'dart:convert';
import 'package:stay_safe/Screens/Service/recent_covid_cases.dart';
import 'package:http/http.dart';

class Covid {

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

  int counter = 0;

  String covidUrl = "https://api.covid19api.com/summary";
  String covidUrl2 = "https://covid19-api.org/api/timeline/NG";

  Future<void> getResults() async{

    try{
      Response response = await get(covidUrl);
      Map data = jsonDecode(response.body);

      Map globalData = data['Global'];
      newConfirmed2 = (globalData['NewConfirmed']);
      totalConfirmed2 = (globalData['TotalConfirmed']);
      newRecovered2 = (globalData['NewRecovered']);
      totalRecovered2 = (globalData['TotalRecovered']);
      totalDeaths2 = (globalData['TotalDeaths']);

      List countryData = data['Countries'];
      Map nigeriaData = countryData[123];
      newConfirmed = (nigeriaData['NewConfirmed']);
      totalConfirmed = (nigeriaData['TotalConfirmed']);
      newRecovered = (nigeriaData['NewRecovered']);
      totalRecovered = (nigeriaData['TotalRecovered']);
      totalDeaths = (nigeriaData['TotalDeaths']);

    }catch(e){
      return null;
    }

  }

  Future<List<RecentCovidCases>> getCases() async{

    try{
      Response response = await get(covidUrl2);
      List data = jsonDecode(response.body);
      List<RecentCovidCases> casesData = [];

      for(var c in data){
        RecentCovidCases cases = RecentCovidCases(date: c['last_update'], cases: c['cases']);
        casesData.add(cases);
      }

      print(casesData.length);
      print(casesData);
      return casesData;

    }catch(e){
      return null;
    }

  }

}