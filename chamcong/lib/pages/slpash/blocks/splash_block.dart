import 'package:chamcong/pages/widgets/app_images.dart';
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
    void NavigatePage(String userType) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(
            userType: userType,
          ),
        ),
      );
    }

    return Stack(children: [
      Container(
          color: Color.fromARGB(255, 43, 41, 41),
          child: Opacity(opacity: 0.4, child: const BackGround())),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 91.sp),
              child: Image.asset(
                AppImages.imgLogo,
                height: 43.sp,
                width: 270.sp,
              ),
            ),
            Column(
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
                    image: AppImages.imgEmployee,
                    onTap: () {
                      NavigatePage('EMPLOYEE');
                    },
                    text: 'Nhân viên',
                    color_button: const Color(0xFF279142),
                    color_text: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 29.sp),
                  child: ButtonComponent(
                    image: AppImages.imgAdmin,
                    onTap: () {
                      NavigatePage('ADMIN');
                    },
                    text: 'Quản trị viên',
                    color_button: Color.fromARGB(255, 18, 18, 18),
                    color_text: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
