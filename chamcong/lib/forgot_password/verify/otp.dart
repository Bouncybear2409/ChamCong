import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.sp,
      height: 30.sp,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFF96F6F)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(
          fontSize: 16.sp,
          color: Color(0xFF2C2C2C),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
          contentPadding: EdgeInsets.zero,
        ),
        maxLength: 1,
        onChanged: (value) {
          // Xử lý khi giá trị thay đổi (nếu cần)
        },
      ),
    );
  }
}
