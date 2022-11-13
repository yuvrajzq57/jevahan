import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jevahan/AllScreens/registrationScreen.dart';

class Splash extends StatefulWidget {
  static const String idScreen = "splashScreen";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF062833),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "JeVahan",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFCFD2CF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
