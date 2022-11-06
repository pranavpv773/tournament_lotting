import 'package:flutter/widgets.dart';
import 'package:tournament_lotter/app/add_tournaments/view/tournament_selectoin.dart';
import 'package:tournament_lotter/app/home/view/home.dart';
import 'package:tournament_lotter/app/settings/view/settings.dart';
import 'package:tournament_lotter/app/tournaments/view/tournment.dart';

class GlobalProvider with ChangeNotifier {
  int selectIndex = 0;
  List pages = [
    HomeScreen(),
    const TournamentScreen(),
    const SelectTournamentScreen(),
    const SettingsScreen()
  ];
  onIndexChange(int value) {
    selectIndex = value;
    notifyListeners();
  }
}
