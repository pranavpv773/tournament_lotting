class User {
  String? id;

  String? firstName;

  String? lastName;

  int? phone;

  String? email;

  String? password;

  User(
      {this.firstName,
      this.password,
      this.lastName,
      this.email,
      this.phone,
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
