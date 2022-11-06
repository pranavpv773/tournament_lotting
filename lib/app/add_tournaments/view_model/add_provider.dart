import 'dart:developer';

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
  List<List> listGroups = [];
  final addTournamentKey = GlobalKey<FormState>();
  List<String> teams = [];
  List<String> teamsA = [];
  List<String> teamsB = [];
  List<int> groupList = [];
  List<String> one = [];
  List<String> two = [];
  List<String> three = [];
  List<String> four = [];
  List<String> five = [];
  List<String> six = [];
  List<String> seven = [];
  List<String> eight = [];
  List<String> nine = [];
  List<String> ten = [];
  int? count;

  createGroup(int limit) {
    for (int i = 2; i < limit; i++) {
      if (limit % i == 0 && i != limit / 2) {
        print(i);
        groupList.add(i);
      }
    }
  }

  void createTeams(int limit, BuildContext context, int available) async {
    if (addTournamentKey.currentState!.validate()) {
      for (int i = 0; i < limit; i++) {
        teams.add(controllers[i].text);
      }
      log(teams.toString());
      await createMatches(context, available);
    } else {}
  }

  createMatches(BuildContext context, int available) async {
    teams.shuffle();
    double limit = teams.length / available;
    groupListMaking(limit);
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
          },
          titleText: 'Title',
          listType: ListType.singleSelect,
          activeColor: const Color.fromARGB(255, 235, 89, 78),
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
  }

  void groupListMaking(value) {
    radioValue = value;
    switch (value) {
      case 2:
        one;
        two;

        break;
      case 3:
        one;
        two;
        break;
      case 4:
        one;
        two;
        three;
        four;
        break;
      case 5:
        one;
        two;
        three;
        four;
        five;
        break;
      case 6:
        choice = "Football";
        color = Colors.greenAccent;
        break;
      case 7:
        choice = "Football";
        color = Colors.greenAccent;
        break;
      case 8:
        choice = "Football";
        color = Colors.greenAccent;
        break;
      case 9:
        choice = "Football";
        color = Colors.greenAccent;
        break;
      case 10:
        choice = "Football";
        color = Colors.greenAccent;
        break;
      default:
        choice = null;
    }
    // print(choice);
    notifyListeners();
  }
}
