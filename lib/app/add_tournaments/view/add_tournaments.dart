import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/add_tournaments/view_model/add_provider.dart';

class AddTournamentScreen extends StatelessWidget {
  const AddTournamentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        leading: const Icon(Icons.sports),
        title: const Text("Add Tournament"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer<AddTournamentProvider>(builder: (context, run, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                    labelText: "Enter your Name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  // inputFormatters: [
                  //   WhitelistingTextInputFormatter.digitsOnly,
                  //   new LengthLimitingTextInputFormatter(10),
                  // ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                    labelText: "Enter your Mobile Number",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("Are you a programmer?"),
                    const SizedBox(width: 25),
                    Radio(
                      value: 'one',
                      groupValue: run.radioValue,
                      onChanged: (value) {
                        run.radioButtonChanges(value!.toString());
                      },
                    ),
                    const Text(
                      "Yes",
                    ),
                    Radio(
                      value: 'two',
                      groupValue: run.radioValue,
                      onChanged: (value) {
                        run.radioButtonChanges(value!.toString());
                      },
                    ),
                    const Text(
                      "No",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                    labelText: "Enter your Email ID",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text("Enter your city"),
                    const SizedBox(width: 25),
                    DropdownButton<String>(
                      value: run.selectedCity,
                      items: <String>['City-A', 'City-B', 'City-C', 'City-D']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        run.selectedCity = newValue;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      onPressed: () {},
                      child: Text("Reset"),
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      onPressed: () {},
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
