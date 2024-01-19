import 'package:chamcong/app_images.dart';
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
        title: Row(
          children: [
            SizedBox(
              width: 80.sp,
            ),
            Text(
              'Verify',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0.06.sp,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.imgBG,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.sp, 60.sp, 16.sp, 16.sp),
              child: Column(
                children: [
                  Text(
                    'Enter the 6 digits code that you received on your mailbox.',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.sp),
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
                            color: const Color(0xFF487E4E),
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
                  SizedBox(
                    height: 20.sp,
                  ),
                  SizedBox(
                    width: 320.sp,
                    height: 50.sp,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9747FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Hoàn tất',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
