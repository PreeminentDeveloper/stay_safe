import 'dart:convert';
import 'package:stay_safe/Screens/Service/countries.dart';
import 'package:stay_safe/Screens/Service/predicted_cases.dart';
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

  String countryCode;

  String covidUrl = "https://api.covid19api.com/summary";
  String covidUrl2 = "https://covid19-api.org/api/timeline/NG";
  // String predictionUrl = "https://covid19-api.org/api/prediction/ng";
  String countriesUrl = "https://covid19-api.org/api/countries";

  Covid({this.countryCode});

  Future<void> getResults() async {
    try {
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
    } catch (e) {
      return null;
    }
  }

  Future<List<RecentCovidCases>> getCases() async {
    try {
      Response response = await get(covidUrl2);
      List data = jsonDecode(response.body);
      List<RecentCovidCases> casesData = [];

      for (var c in data) {
        RecentCovidCases cases =
            RecentCovidCases(date: c['last_update'], cases: c['cases'], deaths: c['deaths'], recovered: c['recovered']);
        casesData.add(cases);
      }

      // print(casesData);
      return casesData;

    } catch (e) {
      return null;
    }
  }

  Future<List<PredictedCases>> getPrediction() async {
    try {
      Response response = await get("https://covid19-api.org/api/prediction/$countryCode");
      
      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(response.body);
        List<PredictedCases> predictedCases = body
            .map((dynamic prediction) => PredictedCases.fromJson(prediction))
            .toList();

        return predictedCases;
      }else{
        throw "Can't get predicted cases";
      }

    } catch (e) {
      return null;
    }
  }

  Future<List<Countries>> getCountries() async {
    try {
      Response response = await get(countriesUrl);
      
      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(response.body);
        List<Countries> countries = body
            .map((dynamic country) => Countries.fromJson(country))
            .toList();

        return countries;
      }else{
        throw "Can't get countries";
      }

    } catch (e) {
      return null;
    }
  }
}
