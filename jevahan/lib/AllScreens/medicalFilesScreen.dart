import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';

class medicalFilesScreen extends StatelessWidget {
  static const String idScreen = "medicalfiles";

  const medicalFilesScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Medical Files",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 30)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                height: 65,
                width: 300,
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
                          "Upload your medical files",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(1, 1, 16, 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.add_box,
                      size: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
