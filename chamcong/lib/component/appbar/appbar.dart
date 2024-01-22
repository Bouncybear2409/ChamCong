import 'package:chamcong/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarComponent extends StatelessWidget {
  const AppbarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
        height: 360.sp,
        width: 80.sp,
        image: const AssetImage(
          AppImages.imgAppBar,
        ),
        fit: BoxFit.cover);
  }
}
