import 'package:chamcong/absence/absence.dart';
import 'package:chamcong/history/history.dart';
import 'package:chamcong/home/home_page.dart';
import 'package:chamcong/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? const TextStyle(color: Color(0xff279142))
                    : const TextStyle(color: Color(0xff595959)),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.black,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: const Color(0xff279142),
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.check, color: Colors.white),
              icon: Icon(
                Icons.check,
                size: 20,
              ),
              label: 'Trang chủ',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.mail_outline, color: Colors.white),
              icon: Badge(
                  child: Icon(
                Icons.mail_outline,
                size: 20,
              )),
              label: 'Đơn nghỉ',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.access_time, color: Colors.white),
              icon: Icon(
                Icons.access_time,
                size: 20,
              ),
              label: 'Lịch sử',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.account_circle, color: Colors.white),
              icon: Icon(Icons.account_circle),
              label: 'Tài khoản',
            ),
          ],
        ),
      ),
      body: <Widget>[
        /// Home page
        const HomePage(),

        /// Absence page
        const Absence(),

        /// History page
        const History(),

        /// Profile page
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
