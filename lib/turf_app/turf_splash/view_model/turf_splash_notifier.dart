import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TurfSplashNotifier with ChangeNotifier {
  String? drop;
  Gender gender = Gender.male;
  onTab(value) {
    gender = value;
    notifyListeners();
  }

  valueChange(String val) {
    drop = val;
    notifyListeners();
  }

  List<String> maleList = ["Shirt", "T-Shirt", "Pants"];
  List<String> feMaleList = ["panties", "Bra", "Petticot"];
  List<String> listitems = [];
  List<String> dress() {
    //  listitems = maleList;
    if (gender == Gender.female) {
      listitems.clear();
      drop = "dropdown";
      listitems = feMaleList;
      notifyListeners();
    } else if (gender == Gender.male) {
      listitems.clear();
      listitems = maleList;
      notifyListeners();
    }
    return listitems;
  }
}

enum Gender { male, female }
