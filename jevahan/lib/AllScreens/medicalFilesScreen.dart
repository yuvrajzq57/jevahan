import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jevahan/AllScreens/mainScreen.dart';

class medicalFilesScreen extends StatefulWidget {
  static const String idScreen = "medicalfiles";

  const medicalFilesScreen({super.key});

  @override
  State<medicalFilesScreen> createState() => _medicalFilesScreenState();
}

class _medicalFilesScreenState extends State<medicalFilesScreen> {
  // PlatformFile? pickedFile;
  // UploadTask? uploadTask;

  // Future uploadFile() async {
  //   final path = 'files/${pickedFile!.name}';
  //   final file = File(pickedFile!.path!);

  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   setState(() {
  //     uploadTask = ref.putFile(file);
  //   });

  //   final snapshot = await uploadTask!.whenComplete(() {});

  //   final urlDownload = await snapshot.ref.getDownloadURL();
  //   print('Donwload Link: $urlDownload');
  //   setState(() {
  //     uploadTask = null;
  //   });
  // }

  // Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;

  //   setState(() {
  //     pickedFile = result.files.first;
  //   });
  // }

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
              const SizedBox(
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
              GestureDetector(
                child: Container(
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
                onTap: () {
                  // selectFile;
                },
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
                    GestureDetector(
                      child: Icon(
                        Icons.upload_file,
                        size: 50,
                      ),
                      onTap: () {
                        // uploadFile;
                      },
                    ),
                  ],
                ),
              ),
              // if (pickedFile != null)
              //   Expanded(
              //     child: Container(
              //       color: Colors.grey[200],
              //       child: Center(
              //         child: Text(pickedFile!.name),
              //       ),
              //     ),
              //   ),
              // buildProgress(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildProgress() => StreamBuilder<TaskSnapshot>(
  //       stream: uploadTask?.snapshotEvents,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           final data = snapshot.data!;
  //           double progress = data.bytesTransferred / data.totalBytes;

  //           return SizedBox(
  //             height: 50,
  //             child: Stack(
  //               fit: StackFit.expand,
  //               children: [
  //                 LinearProgressIndicator(
  //                   value: progress,
  //                   backgroundColor: Colors.grey,
  //                   color: Color(0xFF062833),
  //                 ),
  //                 Center(
  //                   child: Text(
  //                     '${(100 * progress).roundToDouble()}%',
  //                     style: const TextStyle(color: Colors.white),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         } else {
  //           return const SizedBox(
  //             height: 50,
  //           );
  //         }
  //       },
  //     );
}


// Firebase changes: request.time < timestamp.date(2022, 12, 18);