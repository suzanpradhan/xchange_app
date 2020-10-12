class UserModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String countryID;
  final String website;
  final String homePhone;
  final String cellPhone;
  final String workPhone;
  final String company;
  final String position;
  final String skpye;
  final String member_code;
  final String email;

  UserModel(
      {this.firstName,
      this.middleName,
      this.lastName,
      this.address,
      this.city,
      this.state,
      this.zip,
      this.homePhone,
      this.cellPhone,
      this.workPhone,
      this.company,
      this.countryID,
      this.position,
      this.website,
      this.skpye,
      this.member_code,
      this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        member_code: json["member_code"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        countryID: (json["country_id"]),
        homePhone: json["home_phone"],
        cellPhone: json["cell_phone"],
        workPhone: json["work_phone"],
        company: json["company"],
        skpye: json["skype"],
        position: json["position"],
        email: json["email"],
        website: json["website"]);
  }

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "address": address,
        "city": city,
        "state": state,
        "zip": zip,
        "country_id": countryID,
        "home_phone": homePhone,
        "cell_phone": cellPhone,
        "work_phone": workPhone,
        "company": company,
        "website": website,
        "position": position,
        "skype": skpye
      };
}
