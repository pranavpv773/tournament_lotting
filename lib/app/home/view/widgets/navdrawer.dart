// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

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
                            '',
                            style: TextStyle(color: kWhite),
                          ),
                          IconButton(
                            onPressed: () {
                              // RoutesProvider.nextScreen(
                              //   screen: const EditUserScreen(),
                              // );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: kWhite,
                              size: 35,
                            ),
                          )
                        ],
                      )),
                  ListTile(
                    leading: const Icon(
                      Icons.maps_home_work,
                    ),
                    title: const Text(
                      'Home',
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.sports_score_outlined),
                    title: const Text(
                      'Tournaments',
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.swap_horizontal_circle_sharp,
                    ),
                    title: const Text(
                      'Add Tournaments',
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                    ),
                    title: const Text(
                      'Settings',
                    ),
                    onTap: () {},
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
