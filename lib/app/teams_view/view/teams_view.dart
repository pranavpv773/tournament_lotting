import 'package:flutter/material.dart';

class TeamsViewScreen extends StatelessWidget {
  const TeamsViewScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
