class ListingModel {
  final String title;
  final String name;
  final String address;
  final String description;
  final String email;
  final String phone;
  final String website;
  final String image;

  ListingModel(
      {this.title,
      this.name,
      this.address,
      this.description,
      this.email,
      this.phone,
      this.website,
      this.image});

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
        title: json["title"],
        name: json["name"],
        address: json["address"],
        description: json["description"],
        email: json["email"],
        phone: json["phone"],
        website: json["web"],
        image: json["image"]);
  }
  Map<String, String> toJson() => {
        'title': title,
        'name': name,
        'address': address,
        'description': description,
        'email': email,
        'phone': phone,
        'web': website,
      };
}
