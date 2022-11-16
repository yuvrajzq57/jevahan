import 'package:flutter/material.dart';
import 'package:jevahan/AllScreens/contactScreen.dart';
import 'package:jevahan/AllScreens/homeScreenPage.dart';
import 'package:jevahan/AllScreens/loginScreen.dart';
import 'package:jevahan/AllScreens/medicalFilesScreen.dart';
import 'package:jevahan/AllScreens/registrationScreen.dart';
import 'package:jevahan/AllScreens/getStartedScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jevahan/AllScreens/mainscreen.dart';
import 'package:jevahan/AllScreens/servicesScreen.dart';
import 'package:jevahan/utilities/forgotPasswoordPage.dart';

import 'AllScreens/splashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Brand Bold',
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: homeScreenPage(),
      // initialRoute: FirebaseAuth.instance.currentUser == null
      //     ? Splash.idScreen
      //     : MainScreen.idScreen,
      // routes: {
      //   Splash.idScreen: (context) => Splash(),
      //   RegistrationScreen.idScreen: (context) => RegistrationScreen(),
      //   LoginScreen.idScreen: (context) => LoginScreen(),
      //   ForgotPasswordPage.idScreen: (context) => ForgotPasswordPage(),
      //   GetStartedScreen.idScreen: (context) => GetStartedScreen(),
      //   MainScreen.idScreen: (context) => MainScreen(),
      //   medicalFilesScreen.idScreen: (context) => medicalFilesScreen(),
      //   ContactScreen.idScreen: (context) => ContactScreen(),
      //   servicesScreen.idScreen: (context) => servicesScreen(),
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}
