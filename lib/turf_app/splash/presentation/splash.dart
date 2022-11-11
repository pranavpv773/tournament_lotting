import 'package:flutter/material.dart';
import 'package:tournament_lotter/turf_app/core/styles/colors/colors.dart';
import 'package:tournament_lotter/turf_app/splash/presentation/widgets/body.dart';

class TurfSplashScreen extends StatelessWidget {
  const TurfSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Turfcolors.kPrimary,
      body: const SplashBody(),
    );
  }
}
