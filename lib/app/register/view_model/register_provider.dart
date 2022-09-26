// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/register/model/register_model.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/app/utility/view_model/auth_services.dart';
import 'package:tournament_lotter/app/utility/view_model/snack_provider.dart';
import 'package:tournament_lotter/app/verification/view/verification.dart';

class RegisterProvider with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final otpController = TextEditingController();
  String verificationID = "";

  bool otpVisibility = false;
  void registerApp(
    BuildContext context,
  ) async {
    final data = ClubModel(
        email: email.text, clubname: userName.text, phone: phoneNumber.text);
    if (signUpKey.currentState!.validate()) {
      if (password != confirmPassword) {
        context
            .read<SnackTProvider>()
            .errorPassword(context, "password not matching");
      } else {
        try {
          RoutesProvider.nextScreen(screen: const OtpVerificationBody());
          await AuthServices.auth.verifyPhoneNumber(
            phoneNumber: phoneNumber.text,
            verificationCompleted: (PhoneAuthCredential credential) async {
              await AuthServices.auth
                  .signInWithCredential(credential)
                  .then((value) {});
            },
            verificationFailed: (FirebaseAuthException e) {
              Fluttertoast.showToast(
                  msg: e.message.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
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
  }

  disposeControll() {
    userName.clear();
    phoneNumber.clear();
    email.clear();
    confirmPassword.clear();
    password.clear();
  }
}
