import 'package:chamcong/data/models/userloginresponse.dart';
import 'package:chamcong/data/network/api/api_call.dart';
import 'package:chamcong/pages/bottomBar/bottom_bar.dart';
import 'package:chamcong/pages/forgot_password/email_check.dart';
import 'package:chamcong/pages/login/blocks/login_appbar.dart';
import 'package:chamcong/pages/login/blocks/login_textfield.dart';
import 'package:chamcong/pages/login/login_page.dart';
import 'package:chamcong/pages/slpash/splash_page.dart';
import 'package:chamcong/pages/widgets/button.dart/employee_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginBody extends StatefulWidget {
  LoginBody({super.key, required this.userType});
  late String userType;
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  ApiCall api = ApiCall();
  int count = 0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String notificatitonUserText = '';
  String notificatitonPasswordText = '';
  bool _passwordVisible = true;

  void handleForgotPasswordTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EmailCheck(
                userType: widget.userType,
              )),
    );
  }

  void navigateSplash() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SplashPage(),
      ),
    );
  }

  Future<void> validateLogin() async {
    String username = usernameController.text;
    String password = passwordController.text;

    try {
      if (username.isEmpty && password.isEmpty) {
        setState(() {
          notificatitonUserText = 'Vui lòng nhập tài khoản.';
          notificatitonPasswordText = 'Vui lòng nhập mật khẩu.';
        });
      } else if (username.isEmpty) {
        setState(() {
          notificatitonUserText = 'Vui lòng nhập tài khoản.';
          notificatitonPasswordText = '';
        });
      } else if (password.isEmpty) {
        setState(() {
          notificatitonUserText = '';
          notificatitonPasswordText = 'Vui lòng nhập mật khẩu.';
        });
      } else if (password.length < 8) {
        setState(() {
          notificatitonPasswordText = 'Mật khẩu phải lớn hơn hoặc bằng 8';
        });
      } else {
        UserLoginResponse user =
            await ApiCall.loginUser(username, password, widget.userType);
        if (user.success == true) {
          storage.setItem('accessToken', user.data!.accessToken);
          setState(
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomBar(
                    accessToken: user.data!.accessToken,
                    userType: widget.userType,
                  ),
                ),
              );
            },
          );
        }
      }
    } catch (e) {
      count++;
      setState(() {
        notificatitonUserText =
            'Thông tin đăng nhập không hợp lệ, vui lòng nhập lại.';
        notificatitonPasswordText =
            'Thông tin đăng nhập không hợp lệ, vui lòng nhập lại.';
      });
    }

    if (count == 3) {
      // ignore: use_build_context_synchronously
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
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xff414142),
        border: Border.all(
          color: const Color.fromARGB(255, 20, 20, 20),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(25.sp),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20.sp,
          ),
          const LoginAppbar(),
          SizedBox(
            height: 20.sp,
          ),
          LoginTextField(
            textEditingController: usernameController,
            notificatiton: notificatitonUserText,
            hintText: 'Nhập email',
          ),
          SizedBox(height: 20.sp),
          LoginTextField(
            textEditingController: passwordController,
            notificatiton: notificatitonPasswordText,
            hintText: 'Nhập password',
            passwordVisible: _passwordVisible,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: handleForgotPasswordTap,
                  child: Text(
                    'Quên mật khẩu',
                    style: TextStyle(
                      color: const Color(0xFF27AE60),
                      fontSize: 14.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.sp),
          EmployeeButton(
            onTap: validateLogin,
            text: 'Đăng nhập',
            color_button: const Color(0xFF279142),
            color_text: Colors.white,
          ),
          SizedBox(height: 20.sp),
        ],
      ),
    );
  }
}
