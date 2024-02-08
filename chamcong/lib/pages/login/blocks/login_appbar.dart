import 'package:chamcong/pages/slpash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginAppbar extends StatelessWidget {
  const LoginAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateSplash() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashPage(),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        children: [
          InkWell(
            onTap: navigateSplash,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 90.sp,
          ),
          Text(
            'Đăng nhập',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
