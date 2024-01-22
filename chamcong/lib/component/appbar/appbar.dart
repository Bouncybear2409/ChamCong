import 'package:chamcong/app_images.dart';
import 'package:flutter/material.dart';

class AppbarComponent extends StatelessWidget {
  const AppbarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        AppImages.imgAppBar,
      ),
    );
  }
}
