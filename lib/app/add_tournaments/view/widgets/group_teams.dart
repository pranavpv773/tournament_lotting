import 'package:flutter/material.dart';

class GroupingTeams extends StatelessWidget {
  const GroupingTeams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List<Widget>.generate(5, (index) {
        return SizedBox(
          width: 50,
          height: 50,
          child: GridTile(
            child: Card(
                color: Colors.blue.shade200,
                child: Center(
                  child: Text('tile $index'),
                )),
          ),
        );
      }),
    );
  }
}
