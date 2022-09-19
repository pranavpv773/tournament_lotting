import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/add_tournaments/view/add_tournaments.dart';
import 'package:tournament_lotter/app/add_tournaments/view_model/add_provider.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/routes/routes.dart';

class SelectTournamentScreen extends StatelessWidget {
  const SelectTournamentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: kWidth / 1.2,
                height: kHeight / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kWhite,
                ),
                child:
                    Consumer<AddTournamentProvider>(builder: (context, run, _) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Select Tournament"),
                            const SizedBox(width: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.blue,
                                  value: 'Cricket',
                                  groupValue: run.radioValue,
                                  onChanged: (value) {
                                    run.radioButtonChanges(value!.toString());
                                  },
                                ),
                                const Text(
                                  "Cricket",
                                ),
                                Radio(
                                  value: 'Carroms',
                                  groupValue: run.radioValue,
                                  onChanged: (value) {
                                    run.radioButtonChanges(value!.toString());
                                  },
                                ),
                                const Text(
                                  "Carroms",
                                ),
                                Radio(
                                  value: 'Football',
                                  activeColor: Colors.greenAccent,
                                  groupValue: run.radioValue,
                                  onChanged: (value) {
                                    run.radioButtonChanges(value!.toString());
                                  },
                                ),
                                const Text(
                                  "Football",
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            const Text("How Many Teams"),
                            const SizedBox(width: 25),
                            DropdownButton<int>(
                              value: run.selectTeams,
                              items: <int>[
                                4,
                                6,
                                8,
                                10,
                                12,
                                14,
                                16,
                                18,
                                20,
                                22,
                                24,
                                26,
                              ].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text('${value}'),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                run.selectTeam(int.parse(newValue.toString()));
                              },
                            ),
                          ],
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.amber)),
                            onPressed: () {
                              RoutesProvider.removeScreen(
                                  screen: AddTournamentScreen(
                                title: run.choice.toString(),
                                length: run.selectTeams!.toInt(),
                              ));
                            },
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: kWidth / 5),
                              child: const Text("OK"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
