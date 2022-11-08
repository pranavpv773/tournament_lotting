import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/add_tournaments/view_model/add_provider.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'package:tournament_lotter/app/global_screen/view_model/global_provider.dart';
import 'package:tournament_lotter/app/groups/view_model/group_provider.dart';
import 'package:tournament_lotter/app/login/view_model/login_provider.dart';
import 'package:tournament_lotter/app/register/view_model/register_provider.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/app/splash/view/splash.dart';
import 'package:tournament_lotter/app/splash/view_model/splash_provider.dart';
import 'package:tournament_lotter/app/utility/view_model/snack_provider.dart';
import 'package:tournament_lotter/turf_app/turf_splash/view_model/turf_splash_notifier.dart';

import 'app/utility/view_model/auth_services.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => GlobalProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => AuthServices(),
        ),
        ChangeNotifierProvider(
          create: (create) => SnackTProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => AddTournamentProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => GroupProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => TurfSplashNotifier(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: RoutesProvider.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: kPrimary),
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: kWhite,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
