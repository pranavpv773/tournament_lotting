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
    groupListMaking(
      available,
      limit.toInt(),
    );
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
        log("two");
        one.clear();
        teams.shuffle();
        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.clear();
        final tw = availalble * 2;
        two.addAll(teams.sublist(availalble, tw));
        log(two.toString());

        break;
      case 3:
        log("three");
        one.clear();
        teams.shuffle();

        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.clear();
        final tw = availalble * 2;
        two.addAll(teams.sublist(availalble, tw));
        log(two.toString());
        three.clear();
        final th = availalble * 3;
        three.addAll(teams.sublist(tw, th));
        log(three.toString());
        break;
      case 4:
        log("four");
        one.clear();
        teams.shuffle();
        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.clear();
        final tw = availalble * 2;
        two.addAll(teams.sublist(availalble, tw));
        log(two.toString());
        three.clear();
        final th = availalble * 3;
        three.addAll(teams.sublist(tw, th));
        log(three.toString());
        four.clear();
        final fo = availalble * 4;
        four.addAll(teams.sublist(th, fo));
        log(four.toString());
        break;
      case 5:
        log("five");
        one.clear();
        teams.shuffle();
        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.clear();
        final tw = availalble * 2;
        two.addAll(teams.sublist(availalble, tw));
        log(two.toString());
        three.clear();
        final th = availalble * 3;
        three.addAll(teams.sublist(tw, th));
        log(three.toString());
        four.clear();
        final fo = availalble * 4;
        four.addAll(teams.sublist(th, fo));
        log(four.toString());
        five.clear();
        final fi = availalble * 5;
        five.addAll(teams.sublist(fo, fi));
        log(five.toString());

        break;
      case 6:
        log("six");
        one.clear();
        teams.shuffle();
        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.clear();
        final tw = availalble * 2;
        two.addAll(teams.sublist(availalble, tw));
        log(two.toString());
        three.clear();
        final th = availalble * 3;
        three.addAll(teams.sublist(tw, th));
        log(three.toString());
        four.clear();
        final fo = availalble * 4;
        four.addAll(teams.sublist(th, fo));
        log(four.toString());
        five.clear();
        final fi = availalble * 5;
        five.addAll(teams.sublist(fo, fi));
        log(five.toString());
        six.clear();
        final si = availalble * 6;
        six.addAll(teams.sublist(fi, si));
        log(six.toString());

        break;
      case 7:
        log("six");
        one.clear();
        teams.shuffle();
        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.clear();
        final tw = availalble * 2;
        two.addAll(teams.sublist(availalble, tw));
        log(two.toString());
        three.clear();
        final th = availalble * 3;
        three.addAll(teams.sublist(tw, th));
        log(three.toString());
        four.clear();
        final fo = availalble * 4;
        four.addAll(teams.sublist(th, fo));
        log(four.toString());
        five.clear();
        final fi = availalble * 5;
        five.addAll(teams.sublist(fo, fi));
        log(five.toString());
        six.clear();
        final si = availalble * 6;
        six.addAll(teams.sublist(fi, si));
        log(six.toString());
        seven.clear();
        final se = availalble * 7;
        six.addAll(teams.sublist(si, se));
        log(seven.toString());
        break;
      case 8:
        one.clear();
        teams.shuffle();
        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.clear();
        final tw = availalble * 2;
        two.addAll(teams.sublist(availalble, tw));
        log(two.toString());
        three.clear();
        final th = availalble * 3;
        three.addAll(teams.sublist(tw, th));
        log(three.toString());
        four.clear();
        final fo = availalble * 4;
        four.addAll(teams.sublist(th, fo));
        log(four.toString());
        five.clear();
        final fi = availalble * 5;
        five.addAll(teams.sublist(fo, fi));
        log(five.toString());
        six.clear();
        final si = availalble * 6;
        six.addAll(teams.sublist(fi, si));
        log(six.toString());
        seven.clear();
        final se = availalble * 7;
        six.addAll(teams.sublist(si, se));
        log(seven.toString());
        eight.clear();
        final ei = availalble * 8;
        eight.addAll(teams.sublist(se, ei));
        log(eight.toString());
        break;
      case 9:
        log("nine");
        one.clear();
        teams.shuffle();
        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.clear();
        final tw = availalble * 2;
        two.addAll(teams.sublist(availalble, tw));
        log(two.toString());
        three.clear();
        final th = availalble * 3;
        three.addAll(teams.sublist(tw, th));
        log(three.toString());
        four.clear();
        final fo = availalble * 4;
        four.addAll(teams.sublist(th, fo));
        log(four.toString());
        five.clear();
        final fi = availalble * 5;
        five.addAll(teams.sublist(fo, fi));
        log(five.toString());
        six.clear();
        final si = availalble * 6;
        six.addAll(teams.sublist(fi, si));
        log(six.toString());
        seven.clear();
        final se = availalble * 7;
        seven.addAll(teams.sublist(si, se));
        log(seven.toString());
        eight.clear();
        final ei = availalble * 8;
        eight.addAll(teams.sublist(se, ei));
        log(eight.toString());
        nine.clear();
        final ni = availalble * 9;
        nine.addAll(teams.sublist(ei, ni));
        log(nine.toString());
        break;
      case 10:
        log("nine");
        one.clear();
        teams.shuffle();
        one.addAll(teams.sublist(0, availalble));
        log(one.toString());
        two.clear();
        final tw = availalble * 2;
        two.addAll(teams.sublist(availalble, tw));
        log(two.toString());
        three.clear();
        final th = availalble * 3;
        three.addAll(teams.sublist(tw, th));
        log(three.toString());
        four.clear();
        final fo = availalble * 4;
        four.addAll(teams.sublist(th, fo));
        log(four.toString());
        five.clear();
        final fi = availalble * 5;
        five.addAll(teams.sublist(fo, fi));
        log(five.toString());
        six.clear();
        final si = availalble * 6;
        six.addAll(teams.sublist(fi, si));
        log(six.toString());
        seven.clear();
        final se = availalble * 7;
        seven.addAll(teams.sublist(si, se));
        log(seven.toString());
        eight.clear();
        final ei = availalble * 8;
        eight.addAll(teams.sublist(se, ei));
        log(eight.toString());
        nine.clear();
        final ni = availalble * 9;
        nine.addAll(teams.sublist(ei, ni));
        log(nine.toString());
        ten.clear();
        final te = availalble * 10;
        ten.addAll(teams.sublist(ni, te));
        log(ten.toString());
        break;
      default:
        choice = null;
    }
    // print(choice);
    notifyListeners();
  }
}
