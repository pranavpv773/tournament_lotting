// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';

class TextformsField extends StatelessWidget {
  const TextformsField({
    Key? key,
    required this.title,
    this.icon,
    this.icon1,
  }) : super(key: key);
  final String title;
  final Widget? icon;
  final Widget? icon1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        right: 10,
        left: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(
          10,
        ),
        elevation: 2,
        shadowColor: AppColors.kBlack,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: AppTextStyles.formField,
          validator: (value) {
            return "please fill this field";
          },
          decoration: InputDecoration(
            fillColor: AppColors.primary,
            filled: true,
            suffixIcon: icon1,
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: Colors.grey[100] as Color,
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
            hintStyle: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
