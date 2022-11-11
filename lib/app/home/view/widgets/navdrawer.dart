// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/login/view_model/login_provider.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/app/settings/view/settings.dart';
import 'package:tournament_lotter/app/tournaments/view/tournment.dart';
import 'package:tournament_lotter/turf_app/splash/presentation/splash.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimary,
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
                      color: kOrange,
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/boy.png'),
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
                  iconColor: kWhite,
                  tileColor: kPrimary,
                  leading: const Icon(
                    Icons.maps_home_work,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: kWhite,
                    ),
                  ),
                  onTap: () {
                    RoutesProvider.backScreen();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    iconColor: kWhite,
                    tileColor: kOrange,
                    leading: const Icon(Icons.sports_score_outlined),
                    title: Text(
                      'Turf Booking',
                      style: TextStyle(
                        color: kWhite,
                      ),
                    ),
                    onTap: () {
                      RoutesProvider.backScreen();
                      RoutesProvider.nextScreen(
                          screen: const TurfSplashScreen());
                    },
                  ),
                ),
                ListTile(
                  iconColor: kWhite,
                  tileColor: kPrimary,
                  leading: const Icon(
                    Icons.swap_horizontal_circle_sharp,
                  ),
                  title: Text(
                    'Tournaments',
                    style: TextStyle(
                      color: kWhite,
                    ),
                  ),
                  onTap: () {
                    RoutesProvider.backScreen();
                    RoutesProvider.nextScreen(screen: const TournamentScreen());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: kOrange,
                    iconColor: kWhite,
                    leading: const Icon(
                      Icons.settings,
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        color: kWhite,
                      ),
                    ),
                    onTap: () {
                      RoutesProvider.backScreen();
                      RoutesProvider.nextScreen(screen: const SettingsScreen());
                    },
                  ),
                ),
                ListTile(
                  iconColor: kWhite,
                  tileColor: kPrimary,
                  leading: const Icon(
                    Icons.logout,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: kWhite,
                    ),
                  ),
                  onTap: () => context.read<LoginProvider>().logOut(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
