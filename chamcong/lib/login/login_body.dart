import 'package:chamcong/forgot_password/email_check.dart';
import 'package:chamcong/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  int count = 0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String notificatitonText = '';

  void handleForgotPasswordTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmailCheck()),
    );
  }

  bool checkCredentials(String username, String password) {
    return username == 'user' && password == 'password';
  }

  void validateLogin() {
    String username = usernameController.text;
    String password = passwordController.text;
    bool isValidLogin = checkCredentials(username, password);

    if (isValidLogin) {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BottomBar()));
      });
    } else {
      if (username.isEmpty || password.isEmpty) {
        setState(() {
          notificatitonText = 'Vui lòng nhập đầy đủ thông tin.';
        });
      } else if (password.length < 8) {
        setState(() {
          notificatitonText = 'Mật khẩu phải lớn hơn hoặc bằng 8';
        });
      } else {
        count++;
        setState(() {
          notificatitonText = 'Tài khoản hoặc mật khẩu không hợp lệ.';
        });
      }
    }
    if (count == 3) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Bị khóa đăng nhập',
            style: TextStyle(
              color: const Color(0xFF2C2C2C),
              fontSize: 24.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          content: Text(
            'Bạn đã nhập sai tài khoản hoặc mật khẩu quá nhiều lần. Bạn bị khóa đăng nhập trong 5 phút. Vui lòng đăng nhập lại sau 5 phút.',
            style: TextStyle(
              color: const Color(0xFF49454F),
              fontSize: 14.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Đồng ý'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.sp),
      child: Column(
        children: [
          SizedBox(
            height: 60.sp,
          ),
          Text(
            'Đăng nhập',
            style: TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 20.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          SizedBox(
            height: 80.sp,
          ),
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.5.sp, color: const Color(0xFF888888)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: usernameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                      border: notificatitonText.isEmpty
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                      hintText: 'Tài khoản',
                      enabledBorder: notificatitonText.isEmpty
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                      focusedBorder: notificatitonText.isEmpty
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.sp),
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.5.sp, color: const Color(0xFF888888)),
                borderRadius: BorderRadius.circular(10.sp),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                      border: notificatitonText.isEmpty
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                      hintText: 'Mật khẩu',
                      enabledBorder: notificatitonText.isEmpty
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                      focusedBorder: notificatitonText.isEmpty
                          ? InputBorder.none
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.sp),
          Text(
            notificatitonText,
            style: const TextStyle(color: Colors.red),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: handleForgotPasswordTap,
                child: Text(
                  'Quên mật khẩu',
                  style: TextStyle(
                    color: Color(0xFF497F4E),
                    fontSize: 14.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.sp),
          SizedBox(
            width: 320.sp,
            height: 50.sp,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF497F4E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                validateLogin();
              },
              child: Text(
                'Đăng nhập',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
