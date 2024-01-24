import 'package:chamcong/component/background/background.dart';
import 'package:chamcong/component/button.dart/button.dart';
import 'package:chamcong/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    void NavigatePage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          BackGround(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bạn muốn đăng nhập với tư cách là?',
                  style: TextStyle(
                    color: Color(0xFFC6C6C6),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33.sp, bottom: 20.sp),
                  child: ButtonComponent(
                    Function: NavigatePage,
                    text: 'Nhân viên',
                    color_button: Color(0xFF279142),
                    color_text: Colors.white,
                  ),
                ),
                ButtonComponent(
                  Function: () {},
                  text: 'Quản trị viên',
                  color_button: Color(0xFF737373),
                  color_text: Colors.white,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
