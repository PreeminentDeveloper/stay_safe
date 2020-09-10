class RecentCovidCases{

  final String date;
  final int cases;
  final int deaths;
  final int recovered;

  RecentCovidCases({this.date, this.cases, this.deaths, this.recovered});

  factory RecentCovidCases.fromJson(Map<String, dynamic> json){
    return RecentCovidCases(
      date: json['last_update'] as String,
      cases: json['cases'] as int,
      deaths: json['deaths'] as int,
      recovered: json['recovered'] as int,
    );
  }

}