import 'package:flutter/material.dart';
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Select"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer_rounded), label: "Tournament"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: "Account",
          ),
        ],
        currentIndex: context.watch<GlobalProvider>().selectIndex,
        backgroundColor: kPrimary,
        selectedItemColor: kOrange,
        unselectedItemColor: kPrimary,
        showUnselectedLabels: true,
        onTap: (value) {
          context.read<GlobalProvider>().onIndexChange(value);
        },
      ),
    );
  }
}
