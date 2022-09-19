import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

class TextformWidget extends StatelessWidget {
  const TextformWidget({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this field';
          }
        },
        controller: controller,
        style: TextStyle(
          color: kGrey,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          fillColor: kWhite,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              Icons.group_add,
              color: kPrimary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.teal,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
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
