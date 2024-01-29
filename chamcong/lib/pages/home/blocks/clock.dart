import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.sp,
      height: 200.sp,
      child: AnalogClock(
        decoration: BoxDecoration(
            border: Border.all(
                width: 2.0.sp, color: const Color.fromARGB(255, 15, 15, 15)),
            color: Colors.white,
            shape: BoxShape.circle),
        width: 240.0.sp,
        height: 240.0.sp,
        isLive: true,
        showSecondHand: true,
        showNumbers: true,
        showAllNumbers: true,
        textScaleFactor: 1.sp,
        showTicks: true,
        showDigitalClock: false,
        datetime: DateTime.now(),
      ),
    );
  }
}
