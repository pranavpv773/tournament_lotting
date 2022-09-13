import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/register/view/register.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          SwipeablePageRoute(
            builder: (ctx) {
              return const RegisterApp();
            },
          ),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          color: kPrimary,
          fontSize: 15,
        ),
      ),
    );
  }
}
