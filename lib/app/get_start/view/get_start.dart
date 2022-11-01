import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_images.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';
import 'package:git_app/app/login/view/login.dart';
import 'package:git_app/app/utils/view/container_widget.dart';
import 'package:git_app/routes/routes.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.primary1,
        foregroundColor: AppColors.primary1,
        elevation: 5,
        backgroundColor: AppColors.primary,
        toolbarHeight: 400,
        centerTitle: true,
        title: Image.asset(
          AppImages.lap,
          width: width,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
      ),
      body: ContainerWithChild(
        height: height,
        width: width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Get any Repo, Anytime",
                style: AppTextStyles.h1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Choose from 150,000 Repositories with\n most stared repositories of every\n month.",
                    style: AppTextStyles.h2,
                  ),
                ),
              ),
              ButtonWidget(
                horizontal: 80,
                vertical: 10,
                fn: () {
                  Routes.removeScreen(screen: const LoginScreen());
                },
                title: 'Start Commit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.horizontal,
    required this.vertical,
    required this.fn,
    required this.title,
  }) : super(key: key);
  final double horizontal;
  final double vertical;
  final VoidCallback fn;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        primary: AppColors.kPink,
        textStyle: AppTextStyles.buttonText,
      ),
      onPressed: fn,
      child: Text(title),
    );
  }
}
