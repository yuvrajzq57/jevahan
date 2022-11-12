import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFa2b5bb),
          title: Center(
            child: Text(
              "JeVahan",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Color(0xFFf5eddc),
        body: Container(
          child: SizedBox(
            height: 23,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () => {},
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.face, color: Colors.white),
                  onPressed: () => {},
                ),
                label: ''),
          ],
          backgroundColor: Color(0xFF1b435d),
        ),
      ),
    );
  }
}
