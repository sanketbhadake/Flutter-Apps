import 'package:flutter/material.dart';
import 'package:necter_app/cartscreen.dart';
import 'package:necter_app/explorescreen.dart';
import 'package:necter_app/favourtescreen.dart';
import 'package:necter_app/homescreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Homescreen(),
    const Explorescreen(),
    const Cartscreen(),
    const FavouriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(83, 177, 117, 1),
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business_center_sharp,
            ),
            label: "Shop",
            
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_search,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              // color: Colors.black,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: "Favourite",
          ),
        ],
      ),
    );
  }
}
