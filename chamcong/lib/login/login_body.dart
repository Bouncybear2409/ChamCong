import 'package:chamcong/home/bottom_bar.dart';
import 'package:chamcong/verify.dart';
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
      MaterialPageRoute(builder: (context) => const VerifyPage()),
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
            MaterialPageRoute(builder: (context) => const BottommBar()));
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
              color: Color(0xFF2C2C2C),
              fontSize: 24.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          content: Text(
            'Bạn đã nhập sai tài khoản hoặc mật khẩu quá nhiều lần. Bạn bị khóa đăng nhập trong 5 phút. Vui lòng đăng nhập lại sau 5 phút.',
            style: TextStyle(
              color: Color(0xFF49454F),
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          children: [
            SizedBox(
              height: 60.sp,
            ),
            Text(
              'Đăng nhập',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0.06.sp,
              ),
            ),
            SizedBox(
              height: 80.sp,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7.sp),
                borderRadius: BorderRadius.circular(5.sp),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: usernameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                        border: notificatitonText.isEmpty
                            ? InputBorder.none
                            : UnderlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                        hintText: 'Tài khoản',
                        enabledBorder: notificatitonText.isEmpty
                            ? InputBorder.none
                            : UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                        focusedBorder: notificatitonText.isEmpty
                            ? InputBorder.none
                            : UnderlineInputBorder(
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
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7.sp),
                borderRadius: BorderRadius.circular(5.sp),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                        border: notificatitonText.isEmpty
                            ? InputBorder.none
                            : UnderlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                        hintText: 'Mật khẩu',
                        enabledBorder: notificatitonText.isEmpty
                            ? InputBorder.none
                            : UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                        focusedBorder: notificatitonText.isEmpty
                            ? InputBorder.none
                            : UnderlineInputBorder(
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF487E4E),
                      fontSize: 14.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      height: 0.10.sp,
                      letterSpacing: 0.10.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.sp),
            SizedBox(
              width: 320.sp,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  validateLogin();
                },
                child: Text(
                  'Đăng nhập',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.10.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
