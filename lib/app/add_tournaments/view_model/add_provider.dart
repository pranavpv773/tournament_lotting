import 'package:flutter/material.dart';

class AddTournamentProvider with ChangeNotifier {
  String? choice;
  String? radioValue;
  int? selectTeams;
  Color? color;

  List<TextEditingController> controllers = [];
  final addTournamentKey = GlobalKey<FormState>();
  List<String> teams = [];
  List<String> teamsA = [];
  List<String> teamsB = [];
  createTeams(int limit) async {
    for (int i = 0; i < limit; i++) {
      teams.add(controllers[i].text);
      controllers[i].clear();
    }
    teams.shuffle();
    double half = teams.length / 2;
    createMatches(half.toInt());
  }

  createMatches(int limit) async {
    teamsA.addAll(teams.sublist(0, limit));
    teamsB.addAll(teams.sublist(limit));
    print(teamsA);
    print(teamsB);

    teams.shuffle();
  }

  createController(int limit) {
    controllers = List.generate(limit, (i) => TextEditingController());
  }

  void selectTeam(int value) {
    selectTeams = value;
    notifyListeners();
  }

  void radioButtonChanges(String value) {
    radioValue = value;
    switch (value) {
      case 'Cricket':
        choice = "Cricket";
        color = Colors.blue;
        break;
      case 'Carroms':
        choice = "Carroms";
        color = Colors.red;
        break;
      case 'Football':
        choice = "Football";
        color = Colors.greenAccent;
        break;
      default:
        choice = null;
    }
    print(choice);
    notifyListeners();
  }
}