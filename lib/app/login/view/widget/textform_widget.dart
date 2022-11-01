// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';

class TextformsField extends StatelessWidget {
  const TextformsField({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: AppTextStyles.formField,
        decoration: InputDecoration(
          fillColor: AppColors.primary,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Icon(
              icon,
              color: AppColors.primary1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: AppColors.kBlack,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: AppColors.primary1,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: const BorderSide(
              width: 2.0,
            ),
          ),
          hintText: title,
          hintStyle: TextStyle(
            fontSize: 15,
            color: AppColors.kBlack,
          ),
        ),
      ),
    );
  }
}
