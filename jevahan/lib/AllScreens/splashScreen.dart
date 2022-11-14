import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jevahan/AllScreens/getStartedScreen.dart';
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
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => GetStartedScreen()));
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


// Padding(
//                     padding: const EdgeInsets.all(13.0),
//                     child: Container(
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(28, 6, 10, 10),
//                             child: Text(
//                               "Upload your \n Medical files",
//                               style: GoogleFonts.poppins(
//                                   textStyle: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 25,
//                                       color: Colors.white)),
//                             ),
//                           ),
//                         ],
//                       ),
//                       height: 120,
//                       width: 302,
//                       decoration: BoxDecoration(
//                           color: Color(0xFF8D689E),
//                           borderRadius: BorderRadius.all(Radius.circular(20))),
//                     ),
//                   )
