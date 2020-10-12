class CountryModel {
  final String countryID;
  final String countryName;

  CountryModel({this.countryID, this.countryName});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
        countryID: json["country_id"], countryName: json["country_name"]);
  }
}
