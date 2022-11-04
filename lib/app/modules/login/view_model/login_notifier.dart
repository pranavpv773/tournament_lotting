// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:git_app/app/modules/home/view/home_screen.dart';
import 'package:git_app/app/modules/signUp/model/user_model.dart';
import 'package:git_app/app/modules/signUp/view_model/db_provider.dart';
import 'package:git_app/routes/routes.dart';
import 'package:provider/provider.dart';

import '../../home/view_model/home_provider.dart';

class LoginNotifier with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final List<User> userData = [];
  bool obsecure = true;
  Future<void> getLogin(BuildContext context) async {
    if (loginKey.currentState!.validate()) {
      if (password.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('password is incorrect'),
          ),
        );
      } else {
        notifyListeners();
        var dbClient = DbFuctions.db;
        var res = await dbClient.rawQuery(
            "SELECT * FROM UserDb WHERE firstName = '${userName.text.trim().toLowerCase()}' and password = '${password.text.trim().toLowerCase()}'");

        if (res.isNotEmpty) {
          for (var map in res) {
            final user = User.fromMap(map);
            userData.add(user);
          }
          context.read<HomeNotifier>().fetchStaredRepo();
          Routes.removeScreenUntil(
            screen: const HomeScreen(),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Username or password is incorrect'),
            ),
          );
        }
      }
    }
  }

  bool obSecureFn() {
    if (obsecure == true) {
      obsecure = false;
      notifyListeners();
    } else {
      obsecure = true;
      notifyListeners();
    }
    notifyListeners();
    return obsecure;
  }

  void disposeCntrl() {
    userName.clear();
    password.clear();
  }
}
