import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/turf_app/splash/presentation/splash.dart';

import 'statemanagement/provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProviderWidgets(
      child: MaterialApp(
        navigatorKey: RoutesProvider.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: kPrimary),
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: kWhite,
        ),
        home: const TurfSplashScreen(),
      ),
    );
  }
}
