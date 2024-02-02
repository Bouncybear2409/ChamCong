import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent({
    super.key,
    required this.onTap,
    required this.text,
    required this.color_button,
    required this.color_text,
    this.image,
    this.userType,
  });
  final VoidCallback onTap;
  final String text;
  final Color color_text;
  final Color color_button;
  final String? userType;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.sp,
      height: 50.sp,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(21),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color_button,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null) Image.asset(image!),
              SizedBox(
                width: 5.sp,
              ),
              Text(
                text,
                style: TextStyle(
                  color: color_text,
                  fontSize: 18.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
