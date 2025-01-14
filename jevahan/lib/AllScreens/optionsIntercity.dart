import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';
import 'package:jevahan/AllScreens/homeScreenPage.dart';
import 'package:jevahan/AllScreens/mobileICUsearchService.dart';
import 'package:jevahan/AllScreens/mobileicuhomescreen.dart';

class optionsIntercity extends StatefulWidget {
  static const String idScreen = "optionsMobileICU";

  @override
  State<optionsIntercity> createState() => _optionsIntercityState();
}

class _optionsIntercityState extends State<optionsIntercity> {
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = false;
  bool? isChecked5 = false;
  bool? isChecked6 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF062833),
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
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 4, 0, 0),
                child: Text(
                  "Want to book\na Intercity?",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Color(0xFF062833),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              "Select the specialisation below :",
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Color(0xFF062833),
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked1,
                        activeColor: Color(0xFF065734),
                        splashRadius: 25,
                        onChanged: (newBool) {
                          setState(() {
                            isChecked1 = newBool;
                          });
                        }),
                    Text(
                      "Mobile ICU",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xFF062833),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked2,
                        activeColor: Color(0xFF065734),
                        splashRadius: 25,
                        onChanged: (newBool) {
                          setState(() {
                            isChecked2 = newBool;
                          });
                        }),
                    Text(
                      "Organ Transfer",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xFF062833),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked3,
                        activeColor: Color(0xFF065734),
                        splashRadius: 25,
                        onChanged: (newBool) {
                          setState(() {
                            isChecked3 = newBool;
                          });
                        }),
                    Text(
                      "Mobile Mortuary",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xFF062833),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked4,
                        activeColor: Color(0xFF065734),
                        splashRadius: 25,
                        onChanged: (newBool) {
                          setState(() {
                            isChecked4 = newBool;
                          });
                        }),
                    Text(
                      "Non- Emergency Patient Transfer",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xFF062833),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked5,
                        activeColor: Color(0xFF065734),
                        splashRadius: 25,
                        onChanged: (newBool) {
                          setState(() {
                            isChecked5 = newBool;
                          });
                        }),
                    Text(
                      "Others",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xFF062833),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                height: 50.0,
                width: 200.0,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF062833),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Proceed ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, MobileIcuService.idScreen, (route) => false);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
