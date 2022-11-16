import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';

class ContactScreen extends StatelessWidget {
  static const String idScreen = "contact";

  const ContactScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.start,
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
                      "Contact",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 30)),
                    ),
                    SizedBox(
                      height: 37,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 1, 2, 3),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_callback,
                      size: 35,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "XXXX XXXX XXX",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 2, 3),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_callback,
                      size: 35,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "XXXX XXXX XXX",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 2, 3),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 35,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "abc@gmail.com",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF062833),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
