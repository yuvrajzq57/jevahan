import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jevahan/AllScreens/loginScreen.dart';
import 'package:jevahan/AllScreens/splashScreen.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xFFa2b5bb),
        //   title: Center(
        //     child: Text(
        //       "JeVahan",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
        backgroundColor: Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(11),
              child: Column(
                children: [
                  SizedBox(
                    height: 34,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "JeVahan",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF062833)),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xFF27444D),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xFF27444D),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Icon(
                                  Icons.notification_add_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   height: 154,
                  //   width: 320,
                  //   color: Color(0xFFCD5F5F),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(20)),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "24/7 Services",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFEBEB))),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 7, 0, 24),
                            child: Row(
                              children: [
                                Text(
                                  "Learn More",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF0D3C4B))),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.arrow_circle_right),
                                    SizedBox(
                                      width: 100,
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "images/services.jpeg",
                                  height: 40,
                                  width: 40,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 125,
                      width: 315,
                      decoration: BoxDecoration(
                        color: Color(0xFFA7C5CE),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                              child: Text(
                                "Emergency",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 13,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                              child: Text(
                                "Tap to book",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Image.asset(
                              "images/emergency.jpeg",
                              height: 60,
                              width: 60,
                            )
                          ],
                        )
                      ],
                    ),
                    height: 154,
                    width: 315,
                    decoration: BoxDecoration(
                      color: Color(0xFFCD5F5F),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(2, 15, 0, 10),
                                child: Text(
                                  "Mobile ICU",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Image.asset(
                                "images/mobile.jpeg",
                                height: 60,
                                width: 60,
                              )
                            ],
                          ),
                          height: 134,
                          width: 142,
                          decoration: BoxDecoration(
                              color: Color(0xFFA7C5CE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(2, 15, 0, 10),
                                child: Text(
                                  "InterCity",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Image.asset(
                                "images/intercity.png",
                                height: 60,
                                width: 60,
                              )
                            ],
                          ),
                          height: 134,
                          width: 142,
                          decoration: BoxDecoration(
                              color: Color(0xFFA7C5CE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      height: 120,
                      width: 315,
                      decoration: BoxDecoration(
                          color: Color(0xFF8D689E),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 14, 0, 10),
                          child: Row(
                            children: [
                              Text(
                                "Update your\nMedical files",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              Image.asset(
                                "images/hospital.png",
                                height: 50,
                                width: 50,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF677F87),
          selectedItemColor: Colors.green,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.home_rounded,
                    color: Color(0xFFFFFFFF),
                    size: 30,
                  ),
                  onPressed: () => {},
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.person,
                    color: Color(0xFF062833),
                    size: 30,
                  ),
                  onPressed: () => {},
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
//42 header to blurbutton

