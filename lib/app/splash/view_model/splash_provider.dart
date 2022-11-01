import 'package:flutter/widgets.dart';
import 'package:git_app/app/login/view/login.dart';
import 'package:git_app/routes/routes.dart';

class SplashNotifier with ChangeNotifier {
  SplashNotifier() {
    goToScreen();
  }
  goToScreen() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Routes.removeScreenUntil(
      screen: const LoginScreen(),
    );
  }
}
