import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_images.dart';
import 'package:git_app/app/modules/splash/view_model/splash_provider.dart';
import 'package:git_app/app/modules/utils/view/container_widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashNotifier>(context, listen: false).goToScreen();
    });
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ContainerWithChild(
        width: width,
        height: height,
        child: Center(
            child: Image.asset(
          AppImages.logo,
          width: 80,
        )),
      ),
    );
  }
}
