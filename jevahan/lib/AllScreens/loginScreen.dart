import 'package:jevahan/AllScreens/mainScreen.dart';
import 'package:jevahan/AllScreens/registrationScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jevahan/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jevahan/utilities/progressDialog.dart';
import 'package:flutter/material.dart'; // ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(40.0),
              ),
              const SizedBox(
                height: 35.0,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage("images/applogo.png"),
                radius: 80.0,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
              ),
              const SizedBox(
                height: 1.0,
              ),
              const Text(
                "User Login",
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: "Brand Bold",
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontFamily: "Brand Bold",
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    // ignore: prefer_const_constructors
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontFamily: "Brand Bold",
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 168, 186, 246),
                        shape: const StadiumBorder(),
                      ),
                      child: Container(
                        height: 50.0,
                        width: 300.0,
                        padding: const EdgeInsets.all(13.0),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: "Brand Bold"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        if (!emailTextEditingController.text.contains("@")) {
                          displayToastMessage(
                              "Email address not valid", context);
                        } else if (passwordTextEditingController.text.isEmpty) {
                          displayToastMessage(
                              "Password is mandatory.", context);
                        } else {
                          loginAndAutheticateUser(context);
                        }
                      },
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RegistrationScreen.idScreen, (route) => false);
                },
                child: const Text(
                  "Don't have an Account? Register Here.",
                  style: TextStyle(
                      fontFamily: "Brand Bold", fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAutheticateUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Authenticating,\n Please Wait.... ",
          );
        });

    final firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
    )
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error:$errMsg", context);
    }))
        .user;

    if (firebaseUser != null) {
      userRef.child(firebaseUser.uid).once().then((dataSnapshot) {
        // ignore: unnecessary_null_comparison
        if (dataSnapshot != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.idScreen, (route) => false);
          displayToastMessage(
              "You have been Succesfully \nLogged In.", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage(
              "No, Records Exist for this User \n Please Register", context);
        }
      });
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      displayToastMessage("Error Occured - Cannot be signed  in ", context);
    }
  }
}
