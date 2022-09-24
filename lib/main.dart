import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxidex_driver/functions/functions.dart';
import 'package:taxidex_driver/functions/notifications.dart';
import 'package:taxidex_driver/styles/styles.dart';
import 'pages/loadingPage/loadingpage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  checkInternetConnection();
  initMessaging();
  currentPositionUpdate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;
    return GestureDetector(
        onTap: () {
          //remove keyboard on touching anywhere on the screen.
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Taxidex Driver',
            theme: ThemeData(primarySwatch: primarySwatch),
            home: const LoadingPage()));
  }
}
