import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/turf_app/turf_splash/view_model/turf_splash_notifier.dart';

class TurfSplashScreen extends StatelessWidget {
  const TurfSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimary,
        body: Center(
            // child: Image.asset(
            //   "assets/turf/turf_logo.png",
            // ),
            child: Consumer<TurfSplashNotifier>(builder: (context, val, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text("Male"),
                  Radio(
                      value: Gender.male,
                      groupValue: val.gender,
                      onChanged: (Gender? value) {
                        context.read<TurfSplashNotifier>().onTab(value!);
                      }),
                  const Text("Feamle"),
                  Radio(
                      value: Gender.female,
                      groupValue: val.gender,
                      onChanged: (Gender? value) {
                        context.read<TurfSplashNotifier>().onTab(value!);
                      })
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text("How Many Teams"),
                  const SizedBox(width: 25),
                  DropdownButton<String>(
                    hint: val.drop == null
                        ? const Text('Dropdown')
                        : Text(
                            val.drop.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                    items: context
                        .read<TurfSplashNotifier>()
                        .dress()
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      val.valueChange(value.toString());
                    },
                  ),
                ],
              ),
            ],
          );
        })),
      ),
    );
  }
}
