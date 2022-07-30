import 'package:clothingapp/bottom_controller.dart/cart.dart';
import 'package:clothingapp/bottom_controller.dart/settings.dart';
import 'package:flutter/material.dart';
import 'bottom_controller.dart/home.dart';
import 'bottom_controller.dart/shopping_bag.dart';

class BottomComtroller extends StatefulWidget {
  const BottomComtroller({Key? key}) : super(key: key);

  @override
  State<BottomComtroller> createState() => _BottomComtrollerState();
}

class _BottomComtrollerState extends State<BottomComtroller> {
  final pages = const [Home(), ShoppingBag(), Settings(), Cart()];
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: Color.fromRGBO(254, 37, 80, 1),
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Favourite"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Person",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}
