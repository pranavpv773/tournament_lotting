import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

class AddTournamentScreen extends StatelessWidget {
  const AddTournamentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Material(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      elevation: 10,
                      child: Container(
                        height: constraints.maxHeight * 0.8,
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          color: kPrimary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(70),
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 36,
                    top: 25,
                    child: Hero(
                      tag: 'avathar',
                      child: CircleAvatar(
                        backgroundColor: kWhite,
                        radius: 80,
                        backgroundImage: NetworkImage(
                            'https://www.nicepng.com/png/detail/257-2570111_cricket-equipment-gear-cricket-png.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 100,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Cricket",
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Nunito',
                            color: kWhite,
                          ),
                        ),
                        Text(
                          "Total Tournaments: 18",
                          style: TextStyle(
                            color: kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}
