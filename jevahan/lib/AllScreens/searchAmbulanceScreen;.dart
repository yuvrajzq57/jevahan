import 'dart:async';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jevahan/AllScreens/bookedAmbulanceScreen.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';

class searchAmbulanceScreen extends StatefulWidget {
  static const String idScreen = "searchAmbulanceScreen";

  @override
  State<searchAmbulanceScreen> createState() => _searchAmbulanceScreenState();
}

class _searchAmbulanceScreenState extends State<searchAmbulanceScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.029448, 77.560831),
    zoom: 14.4746,
  );

  double bottomPaddingOfMap = 0;

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => bookedAmbulanceScreen()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF062833),
        shadowColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      // on  clicking  book your nearest ambulance it redirects to this page
      body: Stack(
        children: [
          GoogleMap(
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
          //Google maps
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Expanded(
              child: Container(
                //Change to Google maps
                height: 120,
                width: 400,
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "Searching for the \nnearest ambulance ",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF062833)),
                          ),
                        ),
                        SizedBox(
                          width: 75,
                        ),
                        Icon(
                          Icons.blur_circular_outlined,
                          size: 40,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
