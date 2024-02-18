import 'package:chamcong/pages/home/blocks/header_block.dart';
import 'package:chamcong/pages/widgets/button.dart/employee_button.dart';
import 'package:chamcong/pages/home/blocks/flip_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.accessToken});
  final String? accessToken;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Trang chủ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              HeaderBlock(
                accessToken: accessToken,
              ),
              FlipClock(),
            ],
          ),

          // const DateAndTime(),
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
                child: SizedBox(
                  width: 320.sp,
                  height: 50.sp,
                  child: EmployeeButton(
                    onTap: () {},
                    text: 'Chấm công',
                    color_button: const Color(0xFF279142),
                    color_text: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
