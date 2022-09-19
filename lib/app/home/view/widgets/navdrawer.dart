// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/add_tournaments/view/add_tournaments.dart';
import 'package:tournament_lotter/app/add_tournaments/view/tournament_selectoin.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/app/settings/view/settings.dart';
import 'package:tournament_lotter/app/tournaments/view/tournment.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.8,
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  DrawerHeader(
                      decoration: BoxDecoration(
                        color: kPrimary,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/carroms/tournament_logo.png'),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '   ',
                            style: TextStyle(color: kWhite),
                          ),
                        ],
                      )),
                  ListTile(
                    leading: const Icon(
                      Icons.maps_home_work,
                    ),
                    title: const Text(
                      'Home',
                    ),
                    onTap: () {
                      RoutesProvider.backScreen();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.sports_score_outlined),
                    title: const Text(
                      'Add Tournaments',
                    ),
                    onTap: () {
                      RoutesProvider.backScreen();
                      RoutesProvider.nextScreen(
                          screen: const SelectTournamentScreen());
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.swap_horizontal_circle_sharp,
                    ),
                    title: const Text(
                      'Tournaments',
                    ),
                    onTap: () {
                      RoutesProvider.backScreen();
                      RoutesProvider.nextScreen(
                          screen: const TournamentScreen());
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                    ),
                    title: const Text(
                      'Settings',
                    ),
                    onTap: () {
                      RoutesProvider.backScreen();
                      RoutesProvider.nextScreen(screen: const SettingsScreen());
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                    ),
                    title: const Text(
                      'Logout',
                    ),
                    onTap: () => {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
