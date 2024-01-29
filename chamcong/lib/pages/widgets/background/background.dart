import 'package:chamcong/pages/widgets/app_images.dart';
import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.imgBackGround),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
