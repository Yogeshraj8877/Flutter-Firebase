import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/Firebase_Services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen =SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    splashScreen.isLogin(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash Screen"),
      ),
      body: const Center(
        child: Text("Fire Base"),
      ),
    );
  }
}
