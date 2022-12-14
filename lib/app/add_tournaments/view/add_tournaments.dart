import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/add_tournaments/view/widgets/terxtformwidget.dart';
import 'package:tournament_lotter/app/add_tournaments/view_model/add_provider.dart';
import 'package:tournament_lotter/app/app_style/app_style.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  mainAxisSpacing: 0,
                ),
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
            Container(
              height: 50,
              //  color: kPrimary,
              decoration: BoxDecoration(
                border: Border.all(color: kPrimary),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kWhite,
                    kPrimary,
                  ],
                ),
              ),
              width: double.infinity,
              child: Center(
                child: Text(
                  'AVAILABLE GROUPS',
                  style: AppStyle.h1.copyWith(color: kWhite, fontSize: 20),
                ),
              ),
            ),
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
                    kPrimary,
                  ),
                ),
                onPressed: () {
                  context.read<AddTournamentProvider>().createTeams(
                      context.read<AddTournamentProvider>().controllers.length,
                      context,
                      context.read<AddTournamentProvider>().count!.toInt());
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
      decoration: BoxDecoration(
        border: Border.all(color: kOrange.withOpacity(0.5)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kWhite,
            kOrange,
          ],
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Center(
        child: Text(
          context.read<AddTournamentProvider>().groupList[index].toString(),
          style: AppStyle.h1.copyWith(color: kWhite),
        ),
      ),
    );
  }
}
