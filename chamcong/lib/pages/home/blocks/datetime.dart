import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateAndTime extends StatelessWidget {
  const DateAndTime({super.key});

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Chủ nhật';
      case 2:
        return 'Thứ 2';
      case 3:
        return 'Thứ 3';
      case 4:
        return 'Thứ 4';
      case 5:
        return 'Thứ 5';
      case 6:
        return 'Thứ 6';
      case 7:
        return 'Thứ 7';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.sp),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour >= 12 ? 'PM' : 'AM'}',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  color: Colors.white),
            ),
            SizedBox(height: 20.sp),
            Text(
              '${_getDayOfWeek(DateTime.now().weekday)}, ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
