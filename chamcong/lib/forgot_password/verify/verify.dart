import 'package:chamcong/app_color.dart';
import 'package:chamcong/component/background/background.dart';
import 'package:chamcong/component/button.dart/button.dart';
import 'package:chamcong/forgot_password/verify/otp.dart';
import 'package:chamcong/new_pass/new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool isCheck = false;
  bool isError = false;
  String otp = '';

  void updateIsCheck(bool newValue) {
    setState(() {
      isCheck = newValue;
      isError = false;
    });
  }

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
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  OtpTextField(
                    isError: isError,
                    isCheck: isCheck,
                    onChanged: (String value) {
                      setState(() {
                        otp = value;
                      });
                      updateIsCheck(value.length == 6);
                    },
                    onIsCheckChanged:
                        updateIsCheck, // Pass the callback function
                  ),
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
              Column(
                children: [
                  IgnorePointer(
                    ignoring: !isCheck,
                    child: ButtonComponent(
                        onTap: () {
                          // otp valid => vao trang tiep theo
                          // otp invalid => show loi
                          if (otp == '222222') {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewPassword(),
                                ),
                              );
                            });
                          } else {
                            setState(() {
                              isError = true;
                            });
                          }
                        },
                        color_button: isCheck ? Colors.red : AppColors.kGray,
                        color_text: Colors.white,
                        text: 'Xác nhận'),
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
