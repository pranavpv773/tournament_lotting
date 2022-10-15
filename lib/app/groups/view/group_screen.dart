import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/add_tournaments/view_model/add_provider.dart';
import 'package:tournament_lotter/app/app_style/app_style.dart';
import 'package:tournament_lotter/app/groups/view_model/group_provider.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Groups'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'http://sturdavinci.com/wp-content/uploads/edd/2015/05/Stadium-1-Layers.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              mainAxisExtent: 250,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 5,
            ),
            itemCount: context.read<AddTournamentProvider>().count ?? 0,
            itemBuilder: (BuildContext ctx, index) {
              return CardBuilder(
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CardBuilder extends StatelessWidget {
  const CardBuilder({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(138, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              'Group ${context.read<GroupProvider>().alphabets[index]}',
              style: AppStyle.h2.copyWith(color: Colors.indigo),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
