import 'package:chamcong/pages/slpash/blocks/splash_background.dart';
import 'package:chamcong/pages/slpash/blocks/splash_body.dart';
import 'package:chamcong/pages/slpash/blocks/splash_logo.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          SplashBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SplashLogo(),
                SplashBody(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
