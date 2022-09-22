import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class AddTournamentProvider with ChangeNotifier {
  String? choice;
  String? radioValue;
  int? selectTeams;
  Color? color;
  String? singleSelectedIndexText;
  int? selectGroupIndex;
  int? selectIndex;
  List<TextEditingController> controllers = [];
  List<List> groups = [];
  final addTournamentKey = GlobalKey<FormState>();
  List<String> teams = [];
  List<String> teamsA = [];
  List<String> teamsB = [];
  List<int> groupList = [];

  createGroup(int limit) {
    // print(limit);
    for (int i = 2; i < limit; i++) {
      if (limit % i == 0) {
        print(i);
        groupList.add(i);
      }
    }
    print('group:$groupList');
  }

  void createTeams(int limit, BuildContext context) async {
    if (addTournamentKey.currentState!.validate()) {
      for (int i = 0; i < limit; i++) {
        teams.add(controllers[i].text);
        controllers[i].clear();
      }

      await createMatches(context);
    } else {
      teams.clear();
      teamsA.clear();
      teamsB.clear();
      // print(teams);
    }
  }

  createMatches(BuildContext context) async {
    teams.shuffle();
    double limit = teams.length / 2;
    teamsA.addAll(teams.sublist(0, limit.toInt()));
    // print(teamsA);
    teamsB.addAll(teams.sublist(limit.toInt()));
    // print(teamsB);
    dialogBox(context);
  }

  createController(int limit) {
    controllers = List.generate(limit, (i) => TextEditingController());
    groupList.clear();
    createGroup(limit);
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
    // print(choice);
    notifyListeners();
  }

  Future<Object?> dialogBox(BuildContext context) {
    // print(teams);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        int selectedRadio = 0;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text("How Many Teams"),
            const SizedBox(width: 25),
            DropdownButton<int>(
              // value: run.selectTeams,
              items: groupList.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value'),
                );
              }).toList(),
              onChanged: (newValue) {},
            ),
          ],
        );
      },
    );
  }
}
