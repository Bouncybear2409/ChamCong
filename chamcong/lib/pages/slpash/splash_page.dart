import 'package:chamcong/pages/slpash/blocks/splash_block.dart';
import 'package:flutter/material.dart';

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
