import 'package:flutter/material.dart';
import 'package:roomfinder/accounts_screen_section.dart';
import 'package:roomfinder/home_screen_section.dart';
import 'package:roomfinder/search_screen_section.dart';
import 'package:roomfinder/settings_screen_section.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _sections = <Widget>[
    HomeSection(),
    SearchSection(),
    SettingsSection(),
    AccountSection(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: _sections[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purpleAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 25),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp, size: 25),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 25),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: 25),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}