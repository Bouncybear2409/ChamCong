import 'package:chamcong/pages/widgets/background/background.dart';
import 'package:chamcong/pages/widgets/button.dart/button.dart';
import 'package:chamcong/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashBlocks extends StatelessWidget {
  const SplashBlocks({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    void NavigatePage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }

    return Stack(children: [
      const BackGround(),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
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
                onTap: NavigatePage,
                text: 'Nhân viên',
                color_button: const Color(0xFF279142),
                color_text: Colors.white,
              ),
            ),
            ButtonComponent(
              onTap: () {
                NavigatePage;
              },
              text: 'Quản trị viên',
              color_button: const Color(0xFF737373),
              color_text: Colors.white,
            ),
          ],
        ),
      )
    ]);
  }
}
