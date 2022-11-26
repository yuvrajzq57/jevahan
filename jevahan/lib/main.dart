import 'package:flutter/material.dart';
import 'package:jevahan/AllScreens/applicationForm..dart';
import 'package:jevahan/AllScreens/bookedAmbulanceScreen.dart';
import 'package:jevahan/AllScreens/contactScreen.dart';
import 'package:jevahan/AllScreens/emergencyDropDownList.dart';
import 'package:jevahan/AllScreens/homeScreenPage.dart';
import 'package:jevahan/AllScreens/loginScreen.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';
import 'package:jevahan/AllScreens/medicalFilesScreen.dart';
import 'package:jevahan/AllScreens/mobileicuhomescreen.dart';
import 'package:jevahan/AllScreens/optionsIntercity.dart';
import 'package:jevahan/AllScreens/optionsMobileICU.dart';
import 'package:jevahan/AllScreens/registrationScreen.dart';
import 'package:jevahan/AllScreens/getStartedScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jevahan/AllScreens/searchAmbulanceScreen;.dart';
import 'package:jevahan/AllScreens/searchscreen.dart';
import 'package:jevahan/AllScreens/servicesScreen.dart';
import 'package:jevahan/utilities/forgotPasswoordPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      darkTheme: ThemeData.light(),
      // home: homeScreenPage(),
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? Splash.idScreen
          : MainScreen.idScreen,
      routes: {
        Splash.idScreen: (context) => Splash(),
        RegistrationScreen.idScreen: (context) => RegistrationScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        ForgotPasswordPage.idScreen: (context) => ForgotPasswordPage(),
        GetStartedScreen.idScreen: (context) => GetStartedScreen(),
        MainScreen.idScreen: (context) => MainScreen(),
        medicalFilesScreen.idScreen: (context) => medicalFilesScreen(),
        ContactScreen.idScreen: (context) => ContactScreen(),
        servicesScreen.idScreen: (context) => servicesScreen(),
        homeScreenPage.idScreen: (context) => homeScreenPage(),
        SearchScreen.idScreen: (context) => SearchScreen(),
        searchAmbulanceScreen.idScreen: (context) => searchAmbulanceScreen(),
        bookedAmbulanceScreen.idScreen: (context) => bookedAmbulanceScreen(),
        optionMobileICU.idScreen: (context) => optionMobileICU(),
        homescreenicu.idScreen: (context) => homescreenicu(),
        optionsIntercity.idScreen: (context) => optionsIntercity(),
        EmergDropDown.idScreen: (context) => EmergDropDown(),
        ApplicationForm.idScreen: (context) => ApplicationForm(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
