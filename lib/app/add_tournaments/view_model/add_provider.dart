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

  void selectRadio(int value) {
    selectGroupIndex = value;
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
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicListDialogWidget(
          onPositiveClick: () {
            selectRadio(selectIndex!);
            print('object $selectGroupIndex');
          },
          titleText: 'Title',
          listType: ListType.singleSelect,
          activeColor: Color.fromARGB(255, 235, 89, 78),
          selectedIndex: selectIndex,
          dataList: List.generate(
            groupList.length,
            (index) {
              // groupList[index] = selectIndex;
              return groupList[index];
            },
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.linear,
    );
    // selectIndex = index ?? selectIndex;

    // print('selectedIndex:$selectIndex');
    notifyListeners();
    this.singleSelectedIndexText = '${selectIndex ?? ''}';
  }
}
