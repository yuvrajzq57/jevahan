import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jevahan/AllScreens/homeScreenPage.dart';
import 'package:jevahan/Models/placePrediction.dart';
import 'package:jevahan/assistants/requestassistant.dart';
import 'package:jevahan/datahandler/appdata.dart';
import 'package:jevahan/utilities/configMaps.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController pickUpTextEditingController = TextEditingController();
  TextEditingController dropOffTextEditingController = TextEditingController();
  List<PlacePrediction> placePredictionlist = [];

  @override
  Widget build(BuildContext context) {
    String placeAddress =
        Provider.of<AppData>(context).PickupLocation.placeName ?? "";
    pickUpTextEditingController.text = placeAddress;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF062833),
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          // const SizedBox(
          //   height: 45,
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 200.0,
              width: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(22.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 5.0),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Book your nearest ambulance",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF062833))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "images/user.png",
                          height: 16.0,
                          width: 16.0,
                        ),
                        //Pickup Point
                        SizedBox(
                          width: 18.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: TextField(
                                controller: pickUpTextEditingController,
                                decoration: InputDecoration(
                                  hintText: "Pickup Location",
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 11.0, top: 8.0, bottom: 8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Destination point
                    SizedBox(
                      height: 18.0,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "images/user.png",
                          height: 16.0,
                          width: 16.0,
                        ),
                        SizedBox(
                          width: 18.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: TextField(
                                onChanged: (val) {
                                  findPlace(val);
                                },
                                controller: dropOffTextEditingController,
                                decoration: InputDecoration(
                                  hintText: "Dropoff Location",
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 11.0, top: 8.0, bottom: 8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          //tile for displaying prediction
          SizedBox(
            height: 10.0,
          ),
          (placePredictionlist.length > 0)
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return PredictionTile(
                        placePredictions: placePredictionlist[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: placePredictionlist.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  ))
              : Container(),
        ],
      ),
    );
  }

  void findPlace(String placeName) async {
    if (placeName.length > 1) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890&components=country:in";

      var res = await requestassistant.getRequest(autoCompleteUrl);

      if (res == "failed") {
        return;
      }

      if (res["status"] == "OK") {
        var prediction = res["predictions"];

        var placesList = (prediction as List)
            .map((e) => PlacePrediction.fromJson(e))
            .toList();

        setState(() {
          placePredictionlist = placesList;
        });
      }
    }
  }
}

class PredictionTile extends StatelessWidget {
  final PlacePrediction placePredictions;
  PredictionTile({Key? key, required this.placePredictions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 10.0,
          ),
          Row(
            children: [
              Icon(Icons.add_location),
              SizedBox(
                width: 14.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      placePredictions.main_text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      placePredictions.secondary_text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
