// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/home/view/home.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/app/utility/view/auth_services.dart';
import 'package:tournament_lotter/app/utility/view_model/snack_provider.dart';

class RegisterProvider with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  void signUp(
    BuildContext context,
    String email,
    String password,
    String name,
    String phone,
    String confirmPass,
  ) async {
    if (signUpKey.currentState!.validate()) {
      if (password != confirmPass) {
        context
            .read<SnackTProvider>()
            .errorPassword(context, "password not matching");
      } else {
        try {
          await AuthServices.auth
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) => {podtDetailsToFirebase(context)});
        } on FirebaseAuthException catch (ex) {
          context
              .read<SnackTProvider>()
              .errorBox(context, ex.message.toString());
        }
      }
    }
  }

  void podtDetailsToFirebase(BuildContext context) async {
    // calling our fireStore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = AuthServices.auth.currentUser;

    //calling our userModel

    context.read<AuthServices>().loggedClubModelH.email = user!.email;
    context.read<AuthServices>().loggedClubModelH.uid = user.uid;
    context.read<AuthServices>().loggedClubModelH.clubname = userName.text;
    context.read<AuthServices>().loggedClubModelH.phone = phoneNumber.text;

    //sending details to fireStore
    await firebaseFirestore.collection('users').doc(user.uid).set(
          context.read<AuthServices>().loggedClubModelH.toMap(),
        );
    disposeControll();
    context.read<SnackTProvider>().successSnack(context);
    RoutesProvider.removeScreenUntil(screen: HomeScreen());
  }

  disposeControll() {
    userName.clear();
    phoneNumber.clear();
    email.clear();
    confirmPassword.clear();
    password.clear();
  }
}
