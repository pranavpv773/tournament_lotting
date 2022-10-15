import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/add_tournaments/view/widgets/terxtformwidget.dart';
import 'package:tournament_lotter/app/add_tournaments/view_model/add_provider.dart';
import 'package:tournament_lotter/app/app_style/app_style.dart';
import 'package:tournament_lotter/app/groups/view/group_screen.dart';
import 'package:tournament_lotter/app/routes/routes.dart';

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
                  return GestureDetector(
                    onTap: () {
                      context.read<AddTournamentProvider>().count = context
                          .read<AddTournamentProvider>()
                          .groupList[index];
                    },
                    child: AvailableGroupContainer(index: index),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.amber,
                  ),
                ),
                onPressed: () {
                  context.read<AddTournamentProvider>().count != null
                      ? RoutesProvider.nextScreen(
                          screen: const GroupScreen(),
                        )
                      : Fluttertoast.showToast(
                          msg: "Please select available group",
                          toastLength: Toast.LENGTH_LONG,
                        );
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

class AvailableGroupContainer extends StatelessWidget {
  const AvailableGroupContainer({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.amber,
      child: Center(
        child: Text(
          context.read<AddTournamentProvider>().groupList[index].toString(),
          style: AppStyle.h1,
        ),
      ),
    );
  }
}
