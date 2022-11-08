import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

class TurfSplashScreen extends StatelessWidget {
  const TurfSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Center(
        child: Image.asset(
          "assets/turf/turf_logo.png",
        ),
      ),
    );
  }
}
