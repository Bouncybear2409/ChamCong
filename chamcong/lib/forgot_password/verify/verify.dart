import 'package:chamcong/new_pass/new_password.dart';
import 'package:chamcong/forgot_password/verify/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                      color: Color(0xFF4F4F4F),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 30.sp),
                Container(
                  width: 280.sp,
                  height: 30.sp,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OtpTextField(),
                      OtpTextField(),
                      OtpTextField(),
                      OtpTextField(),
                      OtpTextField(),
                      OtpTextField(),
                    ],
                  ),
                ),
                SizedBox(height: 30.sp),
                Text(
                  'Mã OTP bạn vừa nhập không đúng',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF96F6F),
                    fontSize: 14.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30.sp),
                Text(
                  'Mã sẽ hết hạn sau 59s',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4F4F4F),
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
                          color: Color(0xFF595959),
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
            Column(
              children: [
                SizedBox(
                  width: 320.sp,
                  height: 50.sp,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF69B293),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.sp)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Hoàn tất',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
