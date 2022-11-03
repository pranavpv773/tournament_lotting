import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:git_app/app/modules/signUp/view_model/db_provider.dart';

class LoginNotifier with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  Future<void> getLogin() async {
    var dbClient = DbFuctions.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM user WHERE firstName = '${userName.text}' and password = '${password.text}'");

    if (res.isNotEmpty) {
      log(res.toString());
      log("success");
    }
  }
}
