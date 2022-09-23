import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tournament_lotter/app/home/view/home.dart';
import 'package:tournament_lotter/app/login/view/login_screen.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/app/utility/view_model/auth_services.dart';
import 'package:tournament_lotter/app/utility/view_model/snack_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tournament_lotter/app/verification/view/verification.dart';

class LoginProvider with ChangeNotifier {
  final phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  bool otpVisibility = false;

  String verificationID = "";
  onTabLoginFunction(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        await RoutesProvider.nextScreen(screen: const OtpVerificationBody());
        await AuthServices.auth.verifyPhoneNumber(
          phoneNumber: phoneNumber.text,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await AuthServices.auth
                .signInWithCredential(credential)
                .then((value) {
              RoutesProvider.removeScreenUntil(screen: HomeScreen());
            });
          },
          verificationFailed: (FirebaseAuthException e) {
            Fluttertoast.showToast(
              msg: e.message.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            otpVisibility = true;
            verificationID = verificationId;
            notifyListeners();
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );

        notifyListeners();
      } on FirebaseAuthException catch (e) {
        context.read<SnackTProvider>().errorBox(
              context,
              e.message.toString(),
            );
      }
    }
  }

  Future<void> logOut(BuildContext context) async {
    await AuthServices.auth.signOut();
    RoutesProvider.removeScreenUntil(screen: const LoginScreen());
  }

  isValidEmail(String input) {
    if (input.length < 10) {
      return 'Phone number less than 10';
    }
  }

  void verifyOTP() async {
    final shared = await SharedPreferences.getInstance();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await AuthServices.auth.signInWithCredential(credential).then((value) {
      shared.setBool('login', true);
      RoutesProvider.removeScreenUntil(screen: HomeScreen());
      Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
