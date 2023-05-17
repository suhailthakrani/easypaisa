

import 'package:easypaisa/screens/home/view.dart';
import 'package:easypaisa/screens/my_account/view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _items =  [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined), label: 'Cash Points'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_outlined), label: 'Scan Code'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.headset_mic_outlined), label: 'Promotions'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined), label: 'My Account'),
          ];
  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const MyAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 11,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black54,
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: _items
          ),
          
      ),
    );
  }
}