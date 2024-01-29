import 'package:chamcong/pages/widgets/app_color.dart';
import 'package:chamcong/pages/widgets/background/background.dart';
import 'package:chamcong/pages/widgets/button.dart/button.dart';
import 'package:chamcong/pages/forgot_password/verify/verify.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:core';

class EmailCheck extends StatefulWidget {
  const EmailCheck({super.key});

  @override
  State<EmailCheck> createState() => _EmailCheckState();
}

class _EmailCheckState extends State<EmailCheck> {
  TextEditingController emailController = TextEditingController();
  String notificatitonText = '';

  bool isEmailValid(String email) {
    String username = email.split('@')[0];
    return EmailValidator.validate(email) &&
        username.length >= 8 &&
        username.length <= 64 &&
        !username.contains(' ');
  }

  void validateLogin() {
    String email = emailController.text;
    String username = email.split('@')[0];

    if (isEmailValid(email)) {
      setState(() {
        notificatitonText = '';
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerifyPage(),
        ),
      );
    } else {
      setState(() {
        if (email.isEmpty) {
          notificatitonText = 'Vui lòng nhập Email';
        } else if (username.length < 8) {
          notificatitonText = 'Username phải chứa tối thiểu 8 kí tự';
        } else if (username.contains(' ')) {
          notificatitonText = 'Username không được chứa khoảng trắng';
        } else {
          notificatitonText = 'Email không đúng định dạng';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 243, 241, 241),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Nhập email',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      body: Stack(children: [
        const BackGround(),
        Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10.sp,
                  ),
                  Text(
                    'Hãy nhập email của bạn để chúng tôi gửi mã OTP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFEDEDF2),
                      fontSize: 14.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.sp,
                          color: const Color(0xFF888888),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: emailController,
                            autofocus: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.sp),
                              border: notificatitonText.isEmpty
                                  ? InputBorder.none
                                  : OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    ),
                              hintText: 'Nhập email',
                              enabledBorder: notificatitonText.isEmpty
                                  ? InputBorder.none
                                  : OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    ),
                              focusedBorder: notificatitonText.isEmpty
                                  ? InputBorder.none
                                  : OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        notificatitonText,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.sp),
                child: SizedBox(
                  width: 320.sp,
                  height: 50.sp,
                  child: ButtonComponent(
                    onTap: validateLogin,
                    text: 'Tiếp tục',
                    color_button: AppColors.kGreen,
                    color_text: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
