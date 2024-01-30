import 'package:chamcong/pages/absence/absence_page.dart';
import 'package:chamcong/pages/history/history_page.dart';
import 'package:chamcong/pages/home/home_page.dart';
import 'package:chamcong/pages/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required this.userType});
  final String userType;
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
              selectedIcon: Icon(Icons.home_outlined, color: Colors.white),
              icon: Icon(
                Icons.home_outlined,
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
        const HistoryPage(),

        /// Profile page
        ProfilePage(
          userType: widget.userType,
        ),
      ][currentPageIndex],
    );
  }
}