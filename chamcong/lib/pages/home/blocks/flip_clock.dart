import 'dart:async';
import 'package:chamcong/pages/home/blocks/flip_digital.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlipClock extends StatefulWidget {
  const FlipClock({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FlipClockState createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                FlipDigit(digit: now.hour ~/ 10),
                FlipDigit(digit: now.hour % 10),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ':',
              style: TextStyle(color: Color(0xffD9D9D9), fontSize: 30.sp),
            ),
            const SizedBox(
              width: 10,
            ),
            FlipDigit(digit: now.minute ~/ 10),
            FlipDigit(digit: now.minute % 10),
            const SizedBox(
              width: 10,
            ),
            Text(
              ':',
              style: TextStyle(color: Color(0xffD9D9D9), fontSize: 30.sp),
            ),
            const SizedBox(
              width: 10,
            ),
            FlipDigit(digit: now.second ~/ 10),
            FlipDigit(digit: now.second % 10),
          ],
        ),
      ),
    );
  }
}
