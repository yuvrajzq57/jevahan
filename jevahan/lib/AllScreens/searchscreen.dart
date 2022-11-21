import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
            height: 215.0,
            decoration: BoxDecoration(color: Color(0xFFd8ecf2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(height: 5.0),
                Stack(
                  children: [
                    Icon(Icons.arrow_back),
                    Center(
                      child: Text(
                        "Book your nearest ambulance",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF062833))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: [Image.asset("", height: 16.0, width: 16.0)],
                )
              ]),
            ))
      ]),
    );
  }
}
