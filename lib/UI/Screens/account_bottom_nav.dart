import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../LoginPage.dart';


class AccountBottomNav extends StatefulWidget {
  const AccountBottomNav({super.key});

  @override
  State<AccountBottomNav> createState() => _AccountBottomNavState();
}

class _AccountBottomNavState extends State<AccountBottomNav> {

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


  User ? _user;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((event) {
      setState(() {
        _user=event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Account'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_user != null && _user!.photoURL != null)
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(_user!.photoURL!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 15,),
              if (_user != null && _user!.email != null)
                Text(_user!.email!),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => EditProfile()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Background color
                    onPrimary: Colors.white, // Text color
                  ),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.white, // Text color if needed
                    ),
                  ),
                ),
              )

            ],
          ),

        ),


      ),
    );
  }
}