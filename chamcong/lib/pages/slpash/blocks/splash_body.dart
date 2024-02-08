import 'package:chamcong/pages/login/login_page.dart';
import 'package:chamcong/pages/widgets/app_images.dart';
import 'package:chamcong/pages/widgets/button.dart/admin_button.dart';
import 'package:chamcong/pages/widgets/button.dart/employee_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

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

    return Column(
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
          child: EmployeeButton(
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
          child: AdminButton(
            image: AppImages.imgAdmin,
            onTap: () {
              NavigatePage('ADMIN');
            },
            text: 'Quản trị viên',
            color_button: const Color.fromARGB(255, 18, 18, 18),
            color_text: Colors.white,
          ),
        ),
      ],
    );
  }
}
