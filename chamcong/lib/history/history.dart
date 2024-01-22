import 'package:chamcong/app_images.dart';
import 'package:chamcong/component/appbar/appbar.dart';

import 'package:chamcong/component/button.dart/button.dart';
import 'package:chamcong/home/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Lịch sử',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: AppbarComponent(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
    );
  }
}
