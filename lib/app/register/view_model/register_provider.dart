// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/home/view/home.dart';
import 'package:tournament_lotter/app/register/model/register_model.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/app/utility/view_model/auth_services.dart';
import 'package:tournament_lotter/app/utility/view_model/snack_provider.dart';

class RegisterProvider with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  void registerApp(
    BuildContext context,
    String email,
    String password,
    String name,
    String phone,
    String confirmPass,
  ) async {
    final data = ClubModel(email: email, clubname: name, phone: phone);
    if (signUpKey.currentState!.validate()) {
      if (password != confirmPass) {
        context
            .read<SnackTProvider>()
            .errorPassword(context, "password not matching");
      } else {
        try {
          await AuthServices.auth
              .createUserWithEmailAndPassword(email: email, password: password)
              .then(
                (value) => {
                  podtDetailsToFirebase(context),
                },
              );
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
    User? club = AuthServices.auth.currentUser;

    //calling our userModel

    context.read<AuthServices>().loggedClubModel.email = club!.email;
    context.read<AuthServices>().loggedClubModel.uid = club.uid;
    context.read<AuthServices>().loggedClubModel.clubname = userName.text;
    context.read<AuthServices>().loggedClubModel.phone = phoneNumber.text;

    //sending details to fireStore
    await firebaseFirestore.collection('club').doc(club.uid).set(
          context.read<AuthServices>().loggedClubModel.toMap(),
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
