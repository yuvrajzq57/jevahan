import 'package:jevahan/AllScreens/loginScreen.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';
import 'package:jevahan/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jevahan/utilities/progressDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  static const String idScreen = "register";

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  late String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(252, 240, 138, 138),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
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
                "Register as new User",
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
                      controller: nameTextEditingController,
                      onChanged: (text) {
                        value = text;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Name",
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
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "Phone",
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
                        backgroundColor:
                            const Color.fromARGB(255, 246, 221, 120),
                        shape: const StadiumBorder(),
                      ),
                      child: Container(
                        height: 50.0,
                        width: 300.0,
                        padding: const EdgeInsets.all(13.0),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: "Brand Bold"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        if (nameTextEditingController.text.length < 5) {
                          displayToastMessage(
                              "Name must be at leat 4 character,", context);
                        } else if (!emailTextEditingController.text
                            .contains("@")) {
                          displayToastMessage(
                              "Email address not valid", context);
                        } else if (phoneTextEditingController.text.isEmpty) {
                          displayToastMessage(
                              "Phone number is mandatory", context);
                        } else if (passwordTextEditingController.text.length <
                            6) {
                          displayToastMessage(
                              "Password should be atleast 5 Characters.",
                              context);
                        } else {
                          registerNewUser(context);
                        }
                      },
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.idScreen, (route) => false);
                  // builder: (context) => MainScreen(value: value)
                },
                child: const Text(
                  "Already have an Account? Login Here.",
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

  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Registering New User,\n Please Wait.... ",
          );
        });

    final firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      {
        displayToastMessage("Error$errMsg", context);
      }
    }))
        .user;

    if (firebaseUser != null) {
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };

      userRef.child(firebaseUser.uid).set(userDataMap);
      // ignore: use_build_context_synchronously
      displayToastMessage(
          "Congratulations,\n Your Account has been created.", context);

      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.idScreen, (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      // ignore: use_build_context_synchronously
      displayToastMessage("User hasn't been created", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
