import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tournament_lotter/app/add_tournaments/view_model/add_provider.dart';
import 'package:tournament_lotter/app/global_screen/view_model/global_provider.dart';
import 'package:tournament_lotter/app/groups/view_model/group_provider.dart';
import 'package:tournament_lotter/app/login/view_model/login_provider.dart';
import 'package:tournament_lotter/app/register/view_model/register_provider.dart';
import 'package:tournament_lotter/app/splash/view_model/splash_provider.dart';
import 'package:tournament_lotter/app/utility/view_model/auth_services.dart';
import 'package:tournament_lotter/app/utility/view_model/snack_provider.dart';

class MultiProviderWidgets extends StatelessWidget {
  const MultiProviderWidgets({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
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
      ],
      child: child,
    );
  }
}
