class UserModel {
  String name = '';
  String phone = '';
  String username = '';
  String email = '';
  String city = '';
  String website = '';
  String companyName = '';
  String lat = '';
  String lng = '';
  String bs = '';
  String catchPhrase = '';
  String street = '';
  String suite = '';
  String zipcode = '';

  UserModel({
    required this.name,
    required this.phone,
    required this.username,
    required this.email,
    required this.city,
    required this.website,
    required this.companyName,
    required this.lat,
    required this.lng,
    required this.bs,
    required this.catchPhrase,
    required this.street,
    required this.suite,
    required this.zipcode,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    username = json['username'];
    email = json['email'];
    city = json['address']['city'];
    website = json['website'];
    companyName = json['company']['name'];
    lat = json['address']['geo']['lat'];
    lng = json['address']['geo']['lng'];
    bs = json['company']['bs'];
    catchPhrase = json['company']['catchPhrase'];
    street = json['address']['street'];
    suite = json['address']['suite'];
    zipcode = json['address']['zipcode'];
  }
}
