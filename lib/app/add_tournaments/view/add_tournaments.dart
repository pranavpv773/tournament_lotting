import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/add_tournaments/view/widgets/terxtformwidget.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

class AddTournamentScreen extends StatelessWidget {
  const AddTournamentScreen(
      {Key? key, required this.title, required this.length})
      : super(key: key);
  final String title;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: color,
        leading: const Icon(Icons.sports),
        title: Text(title == "null" ? 'Add Tournament' : title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 100,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 0),
              itemCount: length,
              itemBuilder: (BuildContext ctx, index) {
                return TextformWidget(
                  text: 'Team ${index + 1}',
                );
              }),
        ],
      ),
    );
  }
}
