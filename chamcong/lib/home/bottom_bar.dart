import 'package:chamcong/home/home_page.dart';
import 'package:flutter/material.dart';

class BottommBar extends StatefulWidget {
  const BottommBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottommBarState createState() => _BottommBarState();
}

class _BottommBarState extends State<BottommBar> {
  // ignore: prefer_final_fields
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          const HomePage(),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text("Settings Page"),
            ),
          ),
          Container(
            color: Colors.orange,
            child: const Center(
              child: Text("Notifications Page"),
            ),
          ),
          Container(
            color: Colors.purple,
            child: const Center(
              child: Text("Profile Page"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
