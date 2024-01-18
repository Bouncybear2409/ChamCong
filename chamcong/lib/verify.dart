import 'package:chamcong/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nhập mã OTP',
          style: TextStyle(
            color: Color(0xFF2E2E2E),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 47.sp, bottom: 30.sp),
            child: Column(
              children: [
                SizedBox(
                  width: 291.sp,
                  height: 52.sp,
                  child: const Text(
                    'Nhập vào 6 chữ số được gửi tới số điện thoại hoặc email của bạn',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpTextField(),
                    OtpTextField(),
                    OtpTextField(),
                    OtpTextField(),
                    OtpTextField(),
                    OtpTextField(),
                  ],
                ),
                SizedBox(height: 100.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t receive code?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        height: 0.10.sp,
                        letterSpacing: 0.10.sp,
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    GestureDetector(
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: Color(0xFF487E4E),
                          fontSize: 14.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0.10.sp,
                          letterSpacing: 0.10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
