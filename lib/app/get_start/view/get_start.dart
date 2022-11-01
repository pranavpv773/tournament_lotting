import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_images.dart';
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
          AppImages.lottie,
          width: width / 2,
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
        child: Column(
          children: const [
            Text("Get any Repo, Anytime"),
            Text(
                "Choose from 150,000 Repositories with most stared repositories of every month.")
          ],
        ),
      ),
    );
  }
}
