import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';
import 'package:jevahan/AllScreens/searchAmbulanceScreen;.dart';
import 'package:jevahan/AllScreens/searchscreen.dart';
import 'package:jevahan/AllScreens/sideScreen.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter_platform_interface/src/types/camera.dart';
import 'package:jevahan/assistants/assistantmethods.dart';

class homeScreenPage extends StatefulWidget {
  static const String idScreen = "homescreen";

  @override
  State<homeScreenPage> createState() => _homeScreenPageState();
}

class _homeScreenPageState extends State<homeScreenPage> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

  late Position currentPosition;
  var geoLocator = Geolocator();

  double bottomPaddingOfMap = 0;

  void locatePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 14);

    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    // String address = await Assistantmethods.searchCoordinateAddress(position, context);
    // print("This is your address " + address);
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.029448, 77.560831),
    zoom: 14.4746,
  );
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
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: _kGooglePlex,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;
              setState(() {
                bottomPaddingOfMap = 0.0;
              });
              locatePosition();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              child: Icon(Icons.my_location),
              onTap: (() {
                locatePosition();
              }),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 210.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => searchAmbulanceScreen()))
                      },
                      child: Container(
                        height: 66,
                        width: 319,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: Row(
                            children: [
                              Center(
                                child: Text(
                                  "Book your nearest Ambulance",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF062833))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFD8ECF2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()))
                      },
                      child: Container(
                        height: 66,
                        width: 319,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Search your hospital",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF062833))),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFD8ECF2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.0),
                          ),
                        ),
                      ),
                    ),

                    //           SizedBox(
                    //             height: 2,
                    //           ),
                    //           Divider(),
                    //           Container(
                    //             height: 66,
                    //             width: 319,
                    //             alignment: Alignment.centerLeft,
                    //             child: Padding(
                    //               padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    //               child: Text(
                    //                 "Book your nearest ambulance",
                    //                 style: GoogleFonts.poppins(
                    //                     textStyle: TextStyle(
                    //                         fontSize: 18,
                    //                         fontWeight: FontWeight.w500,
                    //                         color: Color(0xFF062833))),
                    //               ),
                    //             ),
                    //             decoration: BoxDecoration(
                    //               color: Color(0xFFD8ECF2),
                    //               borderRadius: BorderRadius.all(
                    //                 Radius.circular(18.0),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
