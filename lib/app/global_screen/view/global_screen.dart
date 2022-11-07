import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/codicon.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/global_screen/view_model/global_provider.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: context
          .watch<GlobalProvider>()
          .pages[context.read<GlobalProvider>().selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Iconify(
              Bx.home_alt,
              color: context.watch<GlobalProvider>().selectIndex == 0
                  ? kOrange
                  : kPrimary,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              AntDesign.select_outlined,
              color: context.watch<GlobalProvider>().selectIndex == 1
                  ? kOrange
                  : kPrimary,
            ),
            label: "Select",
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              EmojioneMonotone.soccer_ball,
              color: context.watch<GlobalProvider>().selectIndex == 2
                  ? kOrange
                  : kPrimary,
            ),
            label: "Tournament",
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              Codicon.account,
              color: context.watch<GlobalProvider>().selectIndex == 3
                  ? kOrange
                  : kPrimary,
            ),
            label: "Account",
          ),
        ],
        currentIndex: context.watch<GlobalProvider>().selectIndex,
        backgroundColor: kPrimary,
        selectedItemColor: kOrange,
        selectedIconTheme: IconThemeData(color: kOrange),
        unselectedIconTheme: IconThemeData(color: kPrimary),
        unselectedItemColor: kPrimary,
        showUnselectedLabels: true,
        onTap: (value) {
          context.read<GlobalProvider>().onIndexChange(value);
        },
      ),
    );
  }
}
