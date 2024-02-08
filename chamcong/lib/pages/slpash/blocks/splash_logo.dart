import 'package:chamcong/pages/widgets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 91.sp),
      child: Image.asset(
        AppImages.imgLogo,
        height: 43.sp,
        width: 270.sp,
      ),
    );
  }
}
