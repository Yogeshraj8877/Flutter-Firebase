import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../LoginPage.dart';
import '../../controller/image_picker_controller.dart';

class NotificationBottomNav extends StatefulWidget {
  const NotificationBottomNav({Key? key}) : super(key: key);

  @override
  State<NotificationBottomNav> createState() => _NotificationBottomNavState();
}

class _NotificationBottomNavState extends State<NotificationBottomNav> {

  bool switchValue = false;
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    // Navigator.pushReplacementNamed(context, 'LoginPage');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );

  }

  final ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Gallery'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_NODCLWy3iX.json'),
          ),
          const SizedBox(height: 20),
          const Text('Image Show', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.red)),
          ElevatedButton(
            onPressed: () async {
              await controller.pickImage();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green, // Background color
              onPrimary: Colors.white, // Text color
            ),
            child: const Text('Pick your Image'),
          ),

          Obx(() {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: controller.image.value?.path.isEmpty ?? true
                  ? Icon(Icons.camera, size: 50)
                  : Image.file(
                File(controller.image.value!.path),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            );
          }),
          ElevatedButton(
            onPressed: () async {
              await controller.uploadImageToFirebase();
              // You might want to add a feedback mechanism here
              // For example, show a snackbar or update UI to indicate upload completion
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green, // Background color
              onPrimary: Colors.white, // Text color
            ),
            child: const Text('Upload to Firebase Storage'),
          ),

          Obx(() {
            if (controller.networkImage.value != null && controller.networkImage.value!.isNotEmpty) {
              return Image.network(controller.networkImage.value!);
            } else {
              return const SizedBox(); // Return an empty SizedBox if no image available yet
            }
          }),
        ],
      ),
    );
  }
}