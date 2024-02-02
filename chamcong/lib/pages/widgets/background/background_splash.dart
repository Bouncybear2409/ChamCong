import 'package:chamcong/pages/widgets/app_images.dart';
import 'package:flutter/material.dart';

class BackGroundSplash extends StatelessWidget {
  const BackGroundSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.imgBackGroundSplash),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
