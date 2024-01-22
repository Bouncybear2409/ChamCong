import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    // ignore: non_constant_identifier_names
    required this.Function,
    required this.text,
  });
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  final Function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.sp,
      height: 50.sp,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF279142),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {
          Function();
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0.sp,
          ),
        ),
      ),
    );
  }
}
