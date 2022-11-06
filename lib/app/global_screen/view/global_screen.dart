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
        items: const [
          BottomNavigationBarItem(
            icon: Iconify(
              Bx.home_alt,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Iconify(AntDesign.select_outlined),
            label: "Select",
          ),
          BottomNavigationBarItem(
            icon: Iconify(EmojioneMonotone.soccer_ball),
            label: "Tournament",
          ),
          BottomNavigationBarItem(
            icon: Iconify(Codicon.account),
            label: "Account",
          ),
        ],
        currentIndex: context.watch<GlobalProvider>().selectIndex,
        backgroundColor: kPrimary,
        selectedItemColor: kOrange,
        selectedIconTheme: IconThemeData(color: kOrange),
        unselectedIconTheme: IconThemeData(color: kPrimary),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (value) {
          context.read<GlobalProvider>().onIndexChange(value);
        },
      ),
    );
  }
}
