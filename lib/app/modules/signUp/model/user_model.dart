class User {
  int? id;

  String firstName;

  String lastName;

  int phone;

  String email;

  String password;

  User(
      {required this.firstName,
      required this.password,
      required this.lastName,
      required this.email,
      required this.phone,
      this.id});

  static User fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final firstName = map['firstName'] as String;
    final password = map['password'] as String;
    final lastName = map['lastName'] as String;
    final phone = map['phone'] as int;
    final email = map['email'] as String;
    return User(
        id: id,
        firstName: firstName,
        password: password,
        lastName: lastName,
        email: email,
        phone: phone);
  }
}
