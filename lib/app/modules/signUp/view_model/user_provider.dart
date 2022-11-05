// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/modules/home/view/home_screen.dart';
import 'package:git_app/app/modules/home/view_model/home_provider.dart';
import 'package:git_app/app/modules/login/view_model/login_notifier.dart';
import 'package:git_app/app/modules/signUp/model/user_model.dart';
import 'package:git_app/app/modules/signUp/view_model/db_provider.dart';
import 'package:git_app/routes/routes.dart';
import 'package:provider/provider.dart';

class UserNotifier with ChangeNotifier {
  final signupKey = GlobalKey<FormState>();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final phonectrl = TextEditingController();
  bool checked = false;
  bool isLoad = false;
  bool obsecure = true;
  signUpFn(BuildContext context) async {
    isLoad = true;
    notifyListeners();
    if (signupKey.currentState!.validate()) {
      log("signup");
      if (passwordCtrl.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(' Password is less than six'),
          ),
        );
        isLoad = false;
        notifyListeners();
      } else if (checked == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please accept terms and conditions'),
          ),
        );
        isLoad = false;
        notifyListeners();
      } else if (isValidEmail(emailCtrl.text.trim()) == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email Format is incorrect'),
          ),
        );
        isLoad = false;
        notifyListeners();
      } else {
        User user = User(
          email: emailCtrl.text.trim().toLowerCase(),
          firstName: firstNameCtrl.text.trim().toLowerCase(),
          lastName: lastNameCtrl.text.trim().toLowerCase(),
          password: passwordCtrl.text.trim().toLowerCase(),
          phone: int.parse(passwordCtrl.text.trim()),
        );
        await context
            .read<DbFuctions>()
            .addUser(user)
            .then((value) => getData(context));
        isLoad = false;
        notifyListeners();
      }
    }
    isLoad = false;
    notifyListeners();
  }

  Future<void> getData(BuildContext context) async {
    log("Reached get data");
    var dbClient = DbFuctions.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM UserDb WHERE firstName = '${firstNameCtrl.text}' and password = '${passwordCtrl.text}'");

    if (res.isNotEmpty) {
      for (var map in res) {
        final user = User.fromMap(map);
        context.read<LoginNotifier>().userData.add(user);
      }
      context.read<HomeNotifier>().fetchStaredRepo();
      Routes.removeScreenUntil(
        screen: const HomeScreen(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.primary1,
          content: const Text('Sign Up Success'),
        ),
      );
      disposeCntrl();
    } else {
      log("error");

      disposeCntrl();
    }
  }

  bool checkBox() {
    if (checked == true) {
      checked = false;
      notifyListeners();
    } else {
      checked = true;
      notifyListeners();
    }
    notifyListeners();
    return checked;
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
    firstNameCtrl.clear();
    lastNameCtrl.clear();
    emailCtrl.clear();
    passwordCtrl.clear();
    phonectrl.clear();
    checked = false;
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
