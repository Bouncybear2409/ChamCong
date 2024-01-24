import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    // ignore: non_constant_identifier_names
    required this.Function,
    required this.text,
    // ignore: non_constant_identifier_names
    required this.color_button,
    // ignore: non_constant_identifier_names
    required this.color_text,
  });
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  final Function;
  final String text;
  // ignore: non_constant_identifier_names
  final Color color_text;
  // ignore: non_constant_identifier_names
  final Color color_button;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.sp,
      height: 50.sp,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color_button,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {
          Function();
        },
        child: Text(
          text,
          style: TextStyle(
            color: color_text,
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
