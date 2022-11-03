class User {
  String? id;

  String? firstName;

  String? lastName;

  String? phone;

  String? email;

  String? password;

  User(
      {required this.firstName,
      required this.password,
      required this.lastName,
      required this.email,
      required this.phone,
      this.id});

  User.map(dynamic obj) {
    id = obj['id'];
    firstName = obj['firstName'];
    password = obj['password'];
    lastName = obj['lastName'];
    phone = obj['phone'];
    email = obj['email'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["firstName"] = firstName;
    map["password"] = password;
    map["lastName"] = lastName;
    map["phone"] = phone;
    map["email"] = email;
    return map;
  }
}
