import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/view/account/account.dart';
import 'package:delivery_app/view/basket/basket.dart';
import 'package:delivery_app/view/browse/browseScreen.dart';
import 'package:delivery_app/view/grocery/grocery_screen.dart';
import 'package:delivery_app/view/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavigationBarUberEats extends StatefulWidget {
  const BottomNavigationBarUberEats({super.key});

  @override
  State<BottomNavigationBarUberEats> createState() => _BottomNavigationBarUberEatsState();
}

class _BottomNavigationBarUberEatsState extends State<BottomNavigationBarUberEats> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
        return [
          const HomeScreen(),
          const BrowseScreen(),
          const GroceryScreen(),
          const BasketScreen(),
          const AccountScreen()
        ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: const FaIcon(FontAwesomeIcons.house),
                title: ("Home"),
                activeColorPrimary: black,
                inactiveColorPrimary: grey,
            ),
            PersistentBottomNavBarItem(
                icon:  const FaIcon(FontAwesomeIcons.magnifyingGlass),
                title: ("Browse"),
                activeColorPrimary: black,
                inactiveColorPrimary: grey,
            ),
            PersistentBottomNavBarItem(
                icon:  const FaIcon(FontAwesomeIcons.basketShopping),
                title: ("Grocery"),
               activeColorPrimary: black,
                inactiveColorPrimary: grey,
            ),
            PersistentBottomNavBarItem(
                icon:  const FaIcon(FontAwesomeIcons.cartShopping),
                title: ("Basket"),
               activeColorPrimary: black,
                inactiveColorPrimary: grey,
            ),
            PersistentBottomNavBarItem(
                icon:  const FaIcon(FontAwesomeIcons.person),
                title: ("Account"),
               activeColorPrimary: black,
                inactiveColorPrimary: grey,
            ),
        ];
    }




  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}