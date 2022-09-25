import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/add_tournaments/view/widgets/terxtformwidget.dart';
import 'package:tournament_lotter/app/add_tournaments/view_model/add_provider.dart';
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
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Form(
              key: context.read<AddTournamentProvider>().addTournamentKey,
              child: GridView.builder(
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
                    controller: context
                        .read<AddTournamentProvider>()
                        .controllers[index],
                  );
                },
              ),
            ),
            const Text('AVAILABLE GROUPS'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 100,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount:
                    context.read<AddTournamentProvider>().groupList.length,
                itemBuilder: (BuildContext ctx, index) {
                  print('object');
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        context
                            .read<AddTournamentProvider>()
                            .groupList[index]
                            .toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
                onPressed: () {
                  context
                      .read<AddTournamentProvider>()
                      .createTeams(length, context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text("ADD TEAMS"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
