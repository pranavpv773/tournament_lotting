import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';

class ContainerWithChild extends StatelessWidget {
  const ContainerWithChild({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
  }) : super(key: key);
  final Widget child;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.primary1,
          ],
        ),
      ),
      child: child,
    );
  }
}
