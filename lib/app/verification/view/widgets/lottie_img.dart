import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieImageWidget extends StatelessWidget {
  const LottieImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Lottie.asset(
        "assets/otpverification.json",
        height: 300.0,
        width: 250.0,
      ),
    );
  }
}
