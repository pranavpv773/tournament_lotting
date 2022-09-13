class ClubModel {
  String? uid;
  String? clubname;
  String? email;
  String? phone;
  ClubModel({
    this.uid,
    this.phone,
    this.clubname,
    this.email,
  });

//data from Server

  factory ClubModel.fromMap(Map<String, dynamic> map) {
    return ClubModel(
      uid: map['uid'],
      clubname: map['clubname'],
      phone: map['phone'],
      email: map['email'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'clubname': clubname,
      'email': email,
      'phone': phone,
    };
  }
}
