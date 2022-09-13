import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/register/view_model/register_provider.dart';
import 'package:tournament_lotter/app/routes/routes.dart';
import 'package:tournament_lotter/app/splash/view/splash.dart';
import 'package:tournament_lotter/app/splash/view_model/splash_provider.dart';
import 'package:tournament_lotter/app/utility/view/auth_services.dart';
import 'package:tournament_lotter/app/utility/view_model/snack_provider.dart';

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
      ],
      child: MaterialApp(
        navigatorKey: RoutesProvider.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: const SplashScreen(),
      ),
    );
  }
}
