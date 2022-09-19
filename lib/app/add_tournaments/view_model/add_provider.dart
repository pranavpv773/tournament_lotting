import 'package:flutter/widgets.dart';

class AddTournamentProvider with ChangeNotifier {
  String? choice;
  String? radioValue;
  String? selectedCity;
  void radioButtonChanges(String value) {
    radioValue = value;
    switch (value) {
      case 'one':
        choice = "He is a programmer !";
        break;
      case 'two':
        choice = "No, He is not a Programmer !";
        break;
      default:
        choice = null;
    }
    debugPrint(choice);
    notifyListeners();
  }
}
