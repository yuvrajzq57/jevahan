import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';

class servicesScreen extends StatelessWidget {
  static const String idScreen = "services";
  const servicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF062833),
        // title: Icon(
        //   Icons.arrow_back,
        //   color: Colors.white,
        // ),
        title: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFFFFF),
          ),
          onPressed: () => {
            Navigator.pushNamedAndRemoveUntil(
                context, MainScreen.idScreen, (route) => false),
          },
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF062833),
      //   // title: Icon(
      //   //   Icons.arrow_back,
      //   //   color: Colors.white,
      //   // ),
      //   title: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Color(0xFFFFFFFF),
      //     ),
      //     onPressed: () => {
      //       Navigator.pushNamedAndRemoveUntil(
      //           context, MainScreen.idScreen, (route) => false),
      //     },
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset("images/servicesmain.jpeg"),
            SizedBox(
              height: 23,
            ),
            Text(
              "24/7 Services",
              style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF062833)),
            ),
            SizedBox(
              height: 41,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                children: [
                  Image.asset(
                    "images/emergency.jpeg",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Book our services any time",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF062833)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                children: [
                  Image.asset(
                    "images/emergency.jpeg",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Direct contact with the\n doctors",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF062833)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                children: [
                  Image.asset(
                    "images/emergency.jpeg",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Track anytime anywhere",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF062833)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 23,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF062833),
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MainScreen.idScreen, (route) => false);
              },
              child: Container(
                height: 49.0,
                width: 272,
                padding: const EdgeInsets.all(13.0),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Brand Bold",
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
