import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';

class bookedAmbulanceScreen extends StatefulWidget {
  static const String idScreen = "bookedAmbulanceScreen";

  const bookedAmbulanceScreen({super.key});

  @override
  State<bookedAmbulanceScreen> createState() => _bookedAmbulanceScreenState();
}

class _bookedAmbulanceScreenState extends State<bookedAmbulanceScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.029448, 77.560831),
    zoom: 14.4746,
  );

  double bottomPaddingOfMap = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF062833),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 25, 25, 15),
            child: Expanded(
              child: Text(
                "Your ambulance has been booked..!!",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF062833)),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFD8ECF2),
            ),
            height: 100,
            width: 340,
            child: Center(
              child: Text(
                "Driver is on the     \nway...!!",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF062833)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          SizedBox(
            height: 440,
            child: GoogleMap(
              padding: EdgeInsets.only(bottom: 2),
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
                  // bottomPaddingOfMap = 0.0;
                });
                // locatePosition();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Track your ambulance here ..",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF062833)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
