// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/login/view_model/login_provider.dart';

class LoginTextforms extends StatelessWidget {
  const LoginTextforms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginProvider>().formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 40, left: 40),
            child: TextFormField(
              validator: (input) =>
                  context.read<LoginProvider>().isValidEmail(input!),
              keyboardType: TextInputType.phone,
              controller: context.read<LoginProvider>().phoneNumber,
              style: TextStyle(
                color: kGrey,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                fillColor: kWhite,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    Icons.mail,
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
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2.0,
                  ),
                ),
                hintText: "Phone",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: kGrey,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 15,
                    ),
                    primary: kPrimary,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                  onPressed: (() async {
                    context.read<LoginProvider>().onTabLoginFunction(context);
                  }),
                  child: const Text(
                    "LOGIN",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
