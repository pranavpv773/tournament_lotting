import 'package:flutter/material.dart';
import 'package:git_app/app/modules/home/view_model/home_provider.dart';
import 'package:git_app/app/modules/login/view_model/login_notifier.dart';
import 'package:git_app/app/modules/signUp/view_model/db_provider.dart';
import 'package:git_app/app/modules/signUp/view_model/user_provider.dart';
import 'package:git_app/app/modules/splash/view/splash.dart';
import 'package:git_app/app/modules/splash/view_model/splash_provider.dart';
import 'package:git_app/routes/routes.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbFuctions().initializeDataBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => SplashNotifier(),
        ),
        ChangeNotifierProvider(
          create: (create) => HomeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (create) => DbFuctions(),
        ),
        ChangeNotifierProvider(
          create: (create) => UserNotifier(),
        ),
        ChangeNotifierProvider(
          create: (create) => LoginNotifier(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Routes.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
