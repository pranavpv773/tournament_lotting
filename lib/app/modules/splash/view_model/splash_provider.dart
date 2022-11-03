import 'package:flutter/widgets.dart';
import 'package:git_app/app/modules/get_start/view/get_start.dart';
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
      screen: const GetStartScreen(),
    );
  }
}
