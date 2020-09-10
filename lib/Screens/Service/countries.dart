class Countries{

  final String countryName;
  final String acronym;

  Countries({this.countryName, this.acronym});

  factory Countries.fromJson(Map<String, dynamic> json){
    return Countries(
      countryName: json['name'] as String,
      acronym: json['alpha2'] as String,
    );
  }

}