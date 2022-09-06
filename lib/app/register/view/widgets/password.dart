// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

class PasswordTextforms extends StatelessWidget {
  const PasswordTextforms({
    Key? key,
    required this.icon,
    required this.text,
    required this.obscureText,
    required this.vertical,
    required this.controller,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final bool obscureText;
  final double vertical;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: vertical,
        right: 40,
        left: 40,
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this field';
          }
        },
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        style: TextStyle(
          color: kGrey,
          fontSize: 18,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: kWhite,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              icon,
              color: kPrimary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: kGrey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.teal,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: kGrey,
              width: 2.0,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 15,
            color: kGrey,
          ),
        ),
      ),
    );
  }
}
