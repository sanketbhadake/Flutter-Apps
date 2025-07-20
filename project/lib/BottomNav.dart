import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:project/Homepage.dart';
import 'package:project/createCake1.dart';
import 'package:project/profile.dart';
import 'package:project/cart.dart';
import 'package:project/categoryNav.dart';

class cakeProject extends StatefulWidget {
  const cakeProject({super.key});

  @override
  State<cakeProject> createState() => _cakeProjectState();
}

class _cakeProjectState extends State<cakeProject> {
  final PersistentTabController _tabController =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _tabController,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardAppears: true,
      context,
      screens: const [
        HomePage(
          title: "",
        ),
        Category(),
        Createcake1(
          type: '',
        ),
        Basket(),
        ProfilePage()
      ],
      items: [
        PersistentBottomNavBarItem(
          iconSize: 35,
          textStyle: const TextStyle(fontSize: 13),
          activeColorPrimary: const Color.fromRGBO(252, 120, 70, 1),
          icon: const Icon(
            Icons.home,
            color: Color.fromRGBO(252, 120, 70, 1),
          ),
          title: "Home",
          onPressed: (context) {
            setState(() {});
            PersistentNavBarNavigator.pushNewScreen(
              context!,
              screen: const HomePage(
                title: '',
              ),
              // withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.fade,
            );
          },
        ),
        PersistentBottomNavBarItem(
          iconSize: 35,
          textStyle: const TextStyle(fontSize: 13),
          activeColorPrimary: const Color.fromRGBO(252, 120, 70, 1),
          icon: const Icon(
            Icons.apps_rounded,
            color: Color.fromRGBO(252, 120, 70, 1),
          ),
          title: "Category",
          onPressed: (context) {
            setState(() {});
            PersistentNavBarNavigator.pushNewScreen(
              context!,
              screen: const Category(),
              // withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.fade,
            );
          },
        ),
        PersistentBottomNavBarItem(
          iconSize: 40,
          textStyle: const TextStyle(fontSize: 13),
          activeColorPrimary: const Color.fromRGBO(252, 120, 70, 1),
          icon: const Icon(Icons.cake_outlined, color: Colors.white),
          title: "Create",
          onPressed: (context) {
            setState(() {});
            PersistentNavBarNavigator.pushNewScreen(
              context!,
              screen: const Createcake1(
                type: '',
              ),
              // withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.fade,
            );
          },
        ),
        PersistentBottomNavBarItem(
          contentPadding: 0,
          iconSize: 35,
          textStyle: const TextStyle(fontSize: 13),
          activeColorPrimary: const Color.fromRGBO(252, 120, 70, 1),
          icon: const Icon(
            Icons.shopping_basket,
            color: Color.fromRGBO(252, 120, 70, 1),
          ),
          title: "Cart",
          onPressed: (context) {
            setState(() {});
            PersistentNavBarNavigator.pushNewScreen(
              context!,
              screen: const Basket(),

              // withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.fade,
            );
          },
        ),
        PersistentBottomNavBarItem(
          onPressed: (context) {
            setState(() {});
            PersistentNavBarNavigator.pushNewScreen(
              context!,
              screen: const ProfilePage(),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.fade,
            );
          },
          iconSize: 35,
          textStyle: const TextStyle(fontSize: 13),
          activeColorPrimary: const Color.fromRGBO(252, 120, 70, 1),
          icon: const Icon(
            Icons.person,
            color: Color.fromRGBO(252, 120, 70, 1),
          ),
          title: "Profile",
        ),
      ],
      navBarStyle: NavBarStyle.style15,
    );
  }
}
