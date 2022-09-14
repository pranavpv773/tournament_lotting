import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/home/view/home.dart';
import 'package:tournament_lotter/app/register/view_model/register_provider.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/app/verification/view/verification.dart';
import 'widgets/password.dart';
import 'widgets/textfield.dart';

class RegisterApp extends StatelessWidget {
  const RegisterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: const Text('REGISTER APP'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 58.0),
              child: Image.asset(
                'assets/trophy.gif',
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: context.read<RegisterProvider>().signUpKey,
                child: Column(
                  children: [
                    RegisterTextforms(
                      icon: Icons.maps_home_work_sharp,
                      text: "Club Name",
                      obscureText: false,
                      vertical: 20,
                      controller: context.read<RegisterProvider>().userName,
                    ),
                    RegisterTextforms(
                      icon: Icons.mobile_screen_share_outlined,
                      text: "Phone",
                      obscureText: false,
                      vertical: 15,
                      controller: context.read<RegisterProvider>().phoneNumber,
                    ),
                    RegisterTextforms(
                      icon: Icons.send_to_mobile_rounded,
                      text: "email",
                      obscureText: false,
                      vertical: 15,
                      controller: context.read<RegisterProvider>().email,
                    ),
                    PasswordTextforms(
                      icon: Icons.lock_outline,
                      text: "Password",
                      obscureText: true,
                      vertical: 15,
                      controller: context.read<RegisterProvider>().password,
                    ),
                    PasswordTextforms(
                      icon: Icons.lock_reset_outlined,
                      text: "Confirm Password",
                      obscureText: true,
                      vertical: 15,
                      controller:
                          context.read<RegisterProvider>().confirmPassword,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 58.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 150,
                            vertical: 15,
                          ),
                          primary: kPrimary,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                        ),
                        onPressed: (() {
                          // context.read<RegisterProvider>().registerApp(
                          //       context,
                          //       context.read<RegisterProvider>().email.text,
                          //       context.read<RegisterProvider>().password.text,
                          //       context.read<RegisterProvider>().userName.text,
                          //       context
                          //           .read<RegisterProvider>()
                          //           .phoneNumber
                          //           .text,
                          //       context
                          //           .read<RegisterProvider>()
                          //           .confirmPassword
                          //           .text,
                          //     );
                          RoutesProvider.nextScreen(
                              screen: OtpVerificationBody());
                        }),
                        child: const Text(
                          "REGISTER",
                        ),
                      ),
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 8.0),
                    //   child: SignUpButtons(primary: Colors.blue, text: "GOOGLE"),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
