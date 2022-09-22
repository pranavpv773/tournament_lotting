// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tournament_lotter/app/home/view/home.dart';
import 'package:tournament_lotter/app/login/view/login_screen.dart';
import 'package:tournament_lotter/app/routes/routes.dart';

class SplashProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    final checkLogged = await SharedPreferences.getInstance();
    final checkResult = checkLogged.getBool('login') ?? false;
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    if (checkResult) {
      RoutesProvider.removeScreen(
        screen: HomeScreen(),
      );
    } else {
      RoutesProvider.removeScreen(
        screen: const LoginScreen(),
      );
    }
  }
}
