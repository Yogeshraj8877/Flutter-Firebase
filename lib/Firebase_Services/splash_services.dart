
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/LoginPage.dart';
import 'package:flutter_firebase_demo/UI/Auth/login_screen.dart';

import '../UI/firebase_firestore/fire_store_list.dart';

class SplashServices{
  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;

    final user =  auth.currentUser ;

    if(user != null){
      Timer(const Duration(seconds: 3),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()))
      );
    }else {
      Timer(const Duration(seconds: 3),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()))
      );
    }
  }
}