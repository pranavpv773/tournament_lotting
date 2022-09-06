import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

class RegisterApp extends StatelessWidget {
  const RegisterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Text('REGISTER APP'),
        centerTitle: true,
      ),
      body: Form(
          child: Column(
        children: [
          TextFormField(
            cursorColor: Theme.of(context).cursorColor,
            initialValue: 'Input text',
            maxLength: 20,
            decoration: const InputDecoration(
              icon: Icon(Icons.favorite),
              labelText: 'Label text',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              helperText: 'Helper text',
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
