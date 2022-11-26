import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jevahan/AllScreens/bookedAmbulanceScreen.dart';
import 'package:jevahan/AllScreens/bookedAmbulanceScreenICU.dart';
import 'package:jevahan/AllScreens/homeScreenPage.dart';

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
    zoom: 11,
  );

  double bottomPaddingOfMap = 0;

  @override
  void initState() {
    super.initState();
    _navigatetohome();
    loadData();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => bookedAmbulanceScreen()));
  }

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

  // Future<Response> response= await dio.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=40.6655101,-73.89188969999998&destinations=40.6905615%2C,-73.9976592&key=YOUR_API_KEY");

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   loadData();
  // }

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

  Dio dio = new Dio();

  LatLng start = LatLng(13.009448, 77.630831);
  LatLng finish = LatLng(13.009448, 73.630831);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, homeScreenPage.idScreen, (route) => false);
          },
        ),
        backgroundColor: Color(0xFF062833),
        shadowColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      // on  clicking  book your nearest ambulance it redirects to this page
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 750,
                    child: GoogleMap(
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
                  ),
                  Container(
                    //Change to Google maps
                    height: 120,
                    width: 400,
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
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
                              width: 40,
                            ),
                            Icon(
                              Icons.location_searching_rounded,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //Google maps
                  Column(
                    children: [
                      SizedBox(
                        height: 400,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 280,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(calculateDistance(
                                          start.latitude,
                                          start.longitude,
                                          finish.latitude,
                                          finish.longitude)
                                      .toString()
                                      .trim() +
                                  '  mins')),
                        ],
                      ),
                      SizedBox(
                        height: 300,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var speed = 60;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    // speed = distance/time;
    var time = (12742 * asin(sqrt(a))) / 60;
    return time.truncateToDouble();
  }
}
