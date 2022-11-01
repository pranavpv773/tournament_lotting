import 'package:flutter/widgets.dart';
import 'package:git_app/app/home/api_services/api_services.dart';
import 'package:git_app/app/home/model/repo_model.dart';

// ignore: depend_on_referenced_packages

class HomeNotifier with ChangeNotifier {
  List<Item> itemList = [];
  fetchjeansColor(String color) async {
    RepositoryModel resp = await StaredApiService().fetchStaredRepo();

    if (resp.items!.isNotEmpty) {
      notifyListeners();
    } else {}
  }
}
