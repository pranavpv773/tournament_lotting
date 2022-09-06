import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://live-production.wcms.abc-cdn.net.au/48f59c88a163f277222597fb692f193c?impolicy=wcms_crop_resize&cropH=1689&cropW=3000&xPos=0&yPos=85&width=862&height=485',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/carroms/tournament_logo.png',
          ),
        ),
      ),
    );
  }
}
