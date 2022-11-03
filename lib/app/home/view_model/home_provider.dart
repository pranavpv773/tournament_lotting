import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:git_app/app/home/api_services/api_services.dart';
import 'package:git_app/app/home/model/repo_model.dart';

// ignore: depend_on_referenced_packages

class HomeNotifier with ChangeNotifier {
  List<Item> itemList = [];
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
}
