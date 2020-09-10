class PredictedCases{

  final String country;
  final String date;
  final int cases;

  PredictedCases({this.country, this.date, this.cases});

  factory PredictedCases.fromJson(Map<String, dynamic> json){
    return PredictedCases(
      country: json['country'] as String,
      date: json['date'] as String,
      cases: json['cases'] as int,
    );
  }

}