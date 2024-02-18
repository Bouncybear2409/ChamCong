import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlipDigit extends StatelessWidget {
  final int digit;

  const FlipDigit({Key? key, required this.digit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            digit.toString(),
            style: TextStyle(fontSize: 50.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
