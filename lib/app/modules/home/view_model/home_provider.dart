import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:git_app/app/modules/home/api_services/api_services.dart';
import 'package:git_app/app/modules/home/model/repo_model.dart';

// ignore: depend_on_referenced_packages

class HomeNotifier with ChangeNotifier {
  final searchCntrl = TextEditingController();
  List<Item> itemList = [];
  DateTime? currentBackPressTime;
  fetchStaredRepo() async {
    RepoModel? resp = await StaredApiService().fetchStaredRepo();

    if (resp!.incompleteResults!) {
      itemList.addAll(resp.items!);
      notifyListeners();
      log("added");
    } else {
      Fluttertoast.showToast(
        msg: "Some error",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: "Double Tab to Exit", toastLength: Toast.LENGTH_LONG);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
