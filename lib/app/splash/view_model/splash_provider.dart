// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/register/view/register.dart';
import 'package:tournament_lotter/app/routes/routes.dart';

class SplashProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    RoutesProvider.removeScreen(screen: const RegisterApp());
  }
}
