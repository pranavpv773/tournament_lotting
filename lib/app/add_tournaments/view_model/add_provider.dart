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
    teams.clear();
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
    log(available.toString());
    final limit = teams.length / available;
    log(limit.toString());
    groupListMaking(limit.toInt(), available);
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

  void groupListMaking(value, availalble) {
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
        log("six");
        teams.shuffle();
        one.clear();
        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.addAll(teams.sublist(7, 12));
        log(two.toString());
//         two.addAll(teams.sublist(13, 12));
//         three;
// two.addAll(teams.sublist(7, 12));
//         four;
//         two.addAll(teams.sublist(7, 12));
//         five;
//         two.addAll(teams.sublist(7, 12));
        six;
        break;
      case 7:
        one;
        two;
        three;
        four;
        five;
        six;
        seven;
        break;
      case 8:
        one;
        two;
        three;
        four;
        five;
        six;
        seven;
        eight;
        break;
      case 9:
        one;
        two;
        three;
        four;
        five;
        six;
        seven;
        eight;
        nine;
        break;
      case 10:
        one;
        two;
        three;
        four;
        five;
        six;
        seven;
        eight;
        nine;
        ten;
        break;
      default:
        choice = null;
    }
    // print(choice);
    notifyListeners();
  }
}
