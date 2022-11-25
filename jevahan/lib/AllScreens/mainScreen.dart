import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jevahan/AllScreens/contactScreen.dart';
import 'package:jevahan/AllScreens/getStartedScreen.dart';
import 'package:jevahan/AllScreens/homeScreenPage.dart';
import 'package:jevahan/AllScreens/loginScreen.dart';
import 'package:jevahan/AllScreens/medicalFilesScreen.dart';
import 'package:jevahan/AllScreens/optionsIntercity.dart';
import 'package:jevahan/AllScreens/optionsMobileICU.dart';
import 'package:jevahan/AllScreens/servicesScreen.dart';
import 'package:jevahan/AllScreens/splashScreen.dart';
import 'package:jevahan/AllScreens/sideScreen.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController pickUpTextEditingController = TextEditingController();
  TextEditingController dropOffTextEditingController = TextEditingController();
  final String key = "AIzaSyA3QShZcuKPRUuNI4uYH_iceRisE1ENLPM";
  CarouselController buttonCarouselController = CarouselController();
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.029448, 77.560831),
    zoom: 14.4746,
  );

  static final Marker _kGooglePlexMarker1 = Marker(
    markerId: MarkerId('_kGooglePlex1'),
    infoWindow: InfoWindow(title: 'Vividius Hospital', onTap: () {}),
    position: LatLng(13.029448, 77.560831),
    icon: BitmapDescriptor.defaultMarker,
  );

  static final Marker _kGooglePlexMarker2 = Marker(
    markerId: MarkerId('_kGooglePlex2'),
    infoWindow: InfoWindow(title: 'Subbaiah Hospital', onTap: () {}),
    position: LatLng(13.030251, 77.560721),
    icon: BitmapDescriptor.defaultMarker,
  );

  static final CameraPosition _kLake = CameraPosition(
    target: LatLng(37.9756565685865, -122.099796966523),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            key: scaffoldKey,
            drawer: sideNavigationDrawer(),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        ContactScreen.idScreen,
                                        (route) => false);
                                  },
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
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
                      SizedBox(
                        height: 15,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150.0,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1.1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: [1, 2, 3].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "24/7 Services",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white)),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Image.asset(
                                            "images/services.png",
                                            height: 50,
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 7, 0, 24),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Learn More",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Color(0xFF0D3C4B))),
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  height: 128,
                                  width: 315,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFA7C5CE),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 14.0,
                                          color: Color.fromARGB(
                                              255, 198, 194, 194),
                                          offset: Offset(
                                            0,
                                            0,
                                          )),
                                    ],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      servicesScreen.idScreen,
                                      (route) => false);
                                },
                              );
                            },
                          );
                        }).toList(),
                      ),
                      // Padding(
                      // padding: const EdgeInsets.all(13.0),
                      // child: Container(
                      // child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // children: [
                      // SizedBox(
                      // height: 15,
                      // ),
                      // Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // children: [
                      // SizedBox(
                      // width: 20,
                      // ),
                      // Text(
                      // "24/7 Services",
                      // style: GoogleFonts.poppins(
                      // textStyle: TextStyle(
                      // fontSize: 28,
                      // fontWeight: FontWeight.w700,
                      // color: Colors.white)),
                      // ),
                      // SizedBox(
                      // width: 15,
                      // ),
                      // Image.asset(
                      // "images/services.png",
                      // height: 50,
                      // width: 50,
                      // ),
                      // ],
                      // ),
                      // Padding(
                      // padding:
                      // const EdgeInsets.fromLTRB(20, 15, 0, 24),
                      // child: Row(
                      // children: [
                      // Text(
                      // "Learn More",
                      // style: GoogleFonts.poppins(
                      // textStyle: TextStyle(
                      // fontSize: 15,
                      // fontWeight: FontWeight.w500,
                      // color: Color(0xFF0D3C4B))),
                      // ),
                      // Row(
                      // mainAxisAlignment:
                      // MainAxisAlignment.spaceEvenly,
                      // children: [
                      // Icon(Icons.arrow_circle_right),
                      // SizedBox(
                      // width: 100,
                      // ),
                      // ],
                      // ),
                      // ],
                      // ),
                      // ),
                      // ],
                      // ),
                      // height: 128,
                      // width: 315,
                      // decoration: BoxDecoration(
                      // color: Color(0xFFA7C5CE),
                      // boxShadow: [
                      // BoxShadow(
                      // blurRadius: 14.0,
                      // color: Color.fromARGB(255, 198, 194, 194),
                      // offset: Offset(
                      // 10,
                      // 10,
                      // )),
                      // ],
                      // borderRadius: BorderRadius.all(
                      // Radius.circular(20),
                      // ),
                      // ),
                      // ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 0, 0),
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
                                  Image.asset(
                                    "images/emergency.png",
                                    height: 60,
                                    width: 60,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 8, 8, 8),
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
                                ],
                              )
                            ],
                          ),
                          height: 154,
                          width: 315,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 14.0,
                                  color: Color.fromARGB(255, 198, 194, 194),
                                  offset: Offset(
                                    10,
                                    10,
                                  )),
                            ],
                            color: Color(0xFFCD5F5F),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              homeScreenPage.idScreen, (route) => false);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(27, 15, 27, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          2, 15, 0, 18),
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
                                      "images/mobile.png",
                                      height: 60,
                                      width: 60,
                                    )
                                  ],
                                ),
                                height: 134,
                                width: 142,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 14.0,
                                          color: Color.fromARGB(
                                              255, 198, 194, 194),
                                          offset: Offset(
                                            10,
                                            10,
                                          )),
                                    ],
                                    color: Color(0xFFA7C5CE),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    optionMobileICU.idScreen, (route) => false);
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          2, 15, 0, 18),
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
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 14.0,
                                          color: Color.fromARGB(
                                              255, 198, 194, 194),
                                          offset: Offset(
                                            10,
                                            10,
                                          )),
                                    ],
                                    color: Color(0xFFA7C5CE),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    optionsIntercity.idScreen,
                                    (route) => false);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        height: 220,
                        width: 310,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 14.0,
                              color: Color.fromARGB(255, 198, 194, 194),
                              offset: Offset(
                                10,
                                10,
                              )),
                        ], borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          child: GoogleMap(
                            padding: EdgeInsets.only(bottom: 0),
                            mapType: MapType.normal,
                            zoomGesturesEnabled: true,
                            zoomControlsEnabled: true,
                            markers: {_kGooglePlexMarker1, _kGooglePlexMarker2},
                            initialCameraPosition: _kGooglePlex,
                            compassEnabled: true,
                            myLocationButtonEnabled: true,
                            onMapCreated: (GoogleMapController controller) {
                              _controllerGoogleMap.complete(controller);
                              newGoogleMapController = controller;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: GestureDetector(
                          child: Container(
                            height: 120,
                            width: 315,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 14.0,
                                      color: Color.fromARGB(255, 198, 194, 194),
                                      offset: Offset(
                                        10,
                                        10,
                                      )),
                                ],
                                color: Color(0xFF8D689E),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 14, 0, 10),
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
                                      width: 40,
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
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                medicalFilesScreen.idScreen, (route) => false);
                          },
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
                        Icons.person,
                        color: Color(0xFF062833),
                        size: 30,
                      ),
                      onPressed: () => {scaffoldKey.currentState?.openDrawer()},
                    ),
                    label: ''),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//42 header to blurbutton
