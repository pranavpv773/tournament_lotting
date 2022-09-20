import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GroupingTeams extends StatelessWidget {
  const GroupingTeams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List<Widget>.generate(5, (index) {
        return Container(
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
