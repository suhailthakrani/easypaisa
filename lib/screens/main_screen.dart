import 'package:easypaisa/screens/cash_points/view.dart';
import 'package:easypaisa/screens/home/view.dart';
import 'package:easypaisa/screens/my_account/view.dart';
import 'package:easypaisa/screens/scan_code/view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static bool visibility = true;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CashPointsScreen(),
    const ScanCodeScreen(),
    const HomeScreen(),
    const MyAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Visibility(
          visible: _currentIndex != 2,
          child: BottomNavigationBar(
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
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined), label: 'Cash Points'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner_outlined),
                  label: 'Scan Code'),
              BottomNavigationBarItem(
                  icon: _currentIndex == 3
                      ? const Icon(
                          Icons.headset_mic,
                          color: Colors.green,
                        )
                      : const Icon(Icons.headset_mic_outlined),
                  label: 'Promotions'),
              BottomNavigationBarItem(
                  icon: _currentIndex == 4
                      ? const Icon(
                          Icons.person,
                          color: Colors.green,
                        )
                      : Icon(Icons.person_outline_outlined),
                  label: 'My Account'),
            ],
          ),
        ),
      ),
    );
  }
}
