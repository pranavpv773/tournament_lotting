import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_images.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';
import 'package:git_app/app/utils/view/container_widget.dart';

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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  primary: AppColors.kPink,
                  textStyle: AppTextStyles.buttonText,
                ),
                onPressed: () {},
                child: const Text('Start Commit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
