import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/splash/view_model/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashProvider>(context, listen: false).goHome(context);
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: kPrimary),
        child: Center(
          child: Image.asset(
            'assets/ball_boy.png',
          ),
        ),
      ),
    );
  }
}
