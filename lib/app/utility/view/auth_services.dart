import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/home/view/home.dart';
import 'package:tournament_lotter/app/register/model/register_model.dart';
import 'package:tournament_lotter/app/routes/routes.dart';

class AuthServices with ChangeNotifier {
  ClubModel loggedClubModelH = ClubModel();
  static FirebaseAuth auth = FirebaseAuth.instance;
  getDataFromCloud(BuildContext context) async {
    User? user = AuthServices.auth.currentUser;

    FirebaseFirestore.instance
        .collection('club')
        .doc(user!.uid)
        .get()
        .then((value) {
      ClubModel.fromMap(value.data()!);
      loggedClubModelH = ClubModel.fromMap(value.data()!);
      RoutesProvider.removeScreenUntil(screen: HomeScreen());
    });
  }

  // onTabGoogleFunction(BuildContext context) async {
  //   try {
  //     final isLogged = await GoogleSignIn().isSignedIn();
  //     if (isLogged) GoogleSignIn().signOut();
  //     final result = await GoogleSignIn().signIn();

  //     final cred = await result!.authentication;
  //     await AuthServices.auth
  //         .signInWithCredential(GoogleAuthProvider.credential(
  //             accessToken: cred.accessToken, idToken: cred.idToken))
  //         .then(
  //           (value) => {
  //             getDataFromCloud(context),
  //           },
  //         );
  //   } on FirebaseAuthException catch (e) {
  //     context.read<SnackTProvider>().errorBox(
  //           context,
  //           e.message.toString(),
  //         );
  //   }
  // }
}
