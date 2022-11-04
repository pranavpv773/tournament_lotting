import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

import 'widgets/navdrawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kOrange,
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        centerTitle: true,
        title: TextButton(
          onPressed: () {
            // RoutesProvider.nextScreen(
            //   screen: const AddItems(),
            // );
          },
          child: Text(
            "ALL TOURNAMENTS",
            style: TextStyle(
              color: kWhite,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
          ),
        ),
        iconTheme: IconThemeData(color: kWhite),
        leading: IconButton(
          icon: Image.asset(
            "assets/trophy_lottie.png",
          ),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: const NavDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/football/loti_football.png',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Empty Tournaments Fixed',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
