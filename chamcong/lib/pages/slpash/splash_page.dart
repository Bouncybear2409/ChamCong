import 'package:chamcong/pages/widgets/background/background.dart';
import 'package:chamcong/pages/widgets/button.dart/button.dart';
import 'package:chamcong/pages/login/login_page.dart';
import 'package:chamcong/pages/slpash/blocks/splash_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashBlocks(),
      ),
    );
  }
}
