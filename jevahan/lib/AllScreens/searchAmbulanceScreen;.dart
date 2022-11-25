import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jevahan/AllScreens/bookedAmbulanceScreen.dart';

import 'package:jevahan/AllScreens/mainScreen.dart';
import 'package:jevahan/AllScreens/searchscreen.dart';

class searchAmbulanceScreen extends StatefulWidget {
  static const String idScreen = "searchAmbulanceScreen";

  @override
  State<searchAmbulanceScreen> createState() => _searchAmbulanceScreenState();
}

class _searchAmbulanceScreenState extends State<searchAmbulanceScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

  List<String> images = [
    'images/iconmap.png',
    'images/iconmap.png',
    'images/iconmap.png',
    'images/iconmap.png',
    'images/iconmap.png',
    'images/iconmap.png',
    'images/iconmap.png',
    'images/iconmap.png',
  ];

  final List<Marker> __markers = <Marker>[
    Marker(
      markerId: MarkerId('12'),
      position: LatLng(13.0302251, 77.560721),
    )
  ];

  final List<LatLng> __latlng = <LatLng>[
    LatLng(13.0302251, 77.560721),
    LatLng(13.029448, 77.660831),
    LatLng(13.014199, 77.5560831),
    LatLng(13.049448, 77.630831),
    LatLng(13.009448, 77.630831),
    LatLng(13.009448, 73.630831),
  ];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.029448, 77.560831),
    zoom: 14.4746,
  );

  double bottomPaddingOfMap = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _navigatetohome();
  // }

  // _navigatetohome() async {
  //   await Future.delayed(Duration(milliseconds: 2000), () {});
  //   Navigator.pushReplacement(context,
  //       MaterialPageRoute(builder: (context) => bookedAmbulanceScreen()));
  // }
  Uint8List? markerImage;

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(images[i], 100);
      __markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: __latlng[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
            title: 'Hospital :' + i.toString(),
          )));

      setState(() {
        markerIcon;
      });
    }
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
            markers: Set<Marker>.of(__markers),
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
  }
}
