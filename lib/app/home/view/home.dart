import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/routes/routes.dart';

import 'widgets/navdrawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kWhite,
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              // RoutesProvider.nextScreen(
              //   screen: const AddItems(),
              // );
            },
            child: Text(
              "ADD",
              style: TextStyle(
                color: kWhite,
              ),
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
          ),
        ),
        iconTheme: IconThemeData(color: kWhite),
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: kWhite,
            radius: 110,
            backgroundImage: const AssetImage(
              'assets/trophy.gif',
            ),
          ),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: const NavDrawer(),
      body: Container(),
    );
  }
}
