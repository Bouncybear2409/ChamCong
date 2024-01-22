import 'package:chamcong/component/background/background.dart';
import 'package:chamcong/forgot_password/verify/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Nhập mã OTP',
          style: TextStyle(
            color: Color.fromARGB(255, 247, 246, 246),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      body: Stack(children: [
        const BackGround(),
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 47.sp,
              ),
              SizedBox(
                width: 291.sp,
                child: const Text(
                  'Nhập vào 6 chữ số được gửi tới số điện thoại hoặc email của bạn',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 30.sp),
              const OtpTextField(),
              SizedBox(height: 30.sp),
              Text(
                'Mã sẽ hết hạn sau 59s',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30.sp),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Không nhận được mã? ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Gửi lại',
                      style: TextStyle(
                        color: Color(0xFF68B193),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
