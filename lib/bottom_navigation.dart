import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UI/Screens/account_bottom_nav.dart';
import 'UI/Screens/cart_bottom_nav.dart';
import 'UI/Screens/crud_operation.dart';
import 'UI/Screens/home_bottom_nav.dart';
import 'UI/Screens/notification_bottom_nav.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int selectedPageIndex = 0;
  var screens = [
    const HomeBottomNav(),
    const CRUDEoperation(),
    const NotificationBottomNav(),
    const AccountBottomNav(),
    const CartBottomNav()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPageIndex,
          selectedItemColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.home,color: Colors.green,),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.store,color: Colors.green,),
                label: 'Store'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.browse_gallery_rounded,color: Colors.green,),
                label: 'Gallery'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.person,color: Colors.green,),
                label: 'Account'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.add_shopping_cart,color: Colors.green,),
                label: 'Cart')
          ],
          onTap: (index) {
            selectedPageIndex = index;
            setState(() {});
          },
        ),
      ),);
  }
}