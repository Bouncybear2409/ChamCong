import 'package:chamcong/pages/widgets/background/background.dart';
import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 43, 41, 41),
      child: const Opacity(
        opacity: 0.4,
        child: BackGround(),
      ),
    );
  }
}
