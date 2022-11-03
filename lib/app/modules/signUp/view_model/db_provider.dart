import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:git_app/app/modules/signUp/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbFuctions with ChangeNotifier {
  static late Database db;

  Future<void> initializeDataBase() async {
    log("db reached");
    db = await openDatabase(
      "git_app",
      version: 1,
      onCreate: (Database db, version) async {
        await db.execute(
            ' CREATE TABLE UserDb (id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, password TEXT, email TEXT, phone INTEGER)');
      },
    );
    getUser();
  }

  Future<void> addUser(User value) async {
    db.rawInsert(
        'INSERT INTO UserDb(firstName, lastName, password, email, phone) VALUES(?, ?, ?, ?, ?)',
        [
          value.firstName,
          value.lastName,
          value.password,
          value.email,
          value.phone
        ]);
  }

  Future<void> getUser() async {
    log("rech get");
    final val = await db.rawQuery(
      'SELECT * FROM UserDb',
    );
    log(val.toString());
  }

  Future<void> getLogin(String userName, String password) async {
    var res = await db.rawQuery(
        "SELECT * FROM UserDb WHERE firstName = '$userName' and password = '$password'");

    if (res.isNotEmpty) {
      log(res.toString());
      log("success");
    }
  }
}
