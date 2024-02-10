import 'package:chamcong/data/models/userloginresponse.dart';
import 'package:chamcong/data/network/api/api_call.dart';
import 'package:chamcong/pages/bottomBar/bottom_bar.dart';
import 'package:chamcong/pages/forgot_password/email_check.dart';
import 'package:chamcong/pages/login/blocks/login_appbar.dart';
import 'package:chamcong/pages/login/blocks/login_logo.dart';
import 'package:chamcong/pages/slpash/splash_page.dart';
import 'package:chamcong/pages/widgets/background/background.dart';
import 'package:chamcong/pages/widgets/button.dart/employee_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localstorage/localstorage.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.userType}) : super(key: key);
  late String userType;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final LocalStorage storage = LocalStorage('access_token');

class _LoginPageState extends State<LoginPage> {
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

    // bool isValidLogin = checkCredentials(username, password);
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            const BackGround(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LoginLogo(),
                Container(
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
                      Container(
                        width: 320.sp,
                        height: 50.sp,
                        decoration: ShapeDecoration(
                          color: const Color.fromARGB(116, 88, 81, 81),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.sp, color: const Color(0xFF888888)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                controller: usernameController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 20),
                                  border: notificatitonUserText.isEmpty
                                      ? InputBorder.none
                                      : OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(11.sp),
                                          borderSide: const BorderSide(
                                              width: 2, color: Colors.red),
                                        ),
                                  hintText: 'Nhập email',
                                  hintStyle:
                                      const TextStyle(color: Color(0xff8B8B8D)),
                                  enabledBorder: notificatitonUserText.isEmpty
                                      ? InputBorder.none
                                      : OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(11.sp),
                                          borderSide: const BorderSide(
                                              width: 2, color: Colors.red),
                                        ),
                                  focusedBorder: notificatitonUserText.isEmpty
                                      ? InputBorder.none
                                      : OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(11.sp),
                                          borderSide: const BorderSide(
                                              width: 2, color: Colors.red),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Padding(
                        padding: EdgeInsets.only(left: 18.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 4.sp,
                            ),
                            Text(
                              notificatitonUserText,
                              style: TextStyle(
                                color: const Color(0xFFF96F6F),
                                fontSize: 12.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.sp),
                      Container(
                        width: 320.sp,
                        height: 50.sp,
                        decoration: ShapeDecoration(
                          color: const Color.fromARGB(116, 88, 81, 81),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.sp, color: const Color(0xFF888888)),
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                controller: passwordController,
                                obscureText: _passwordVisible,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    icon: _passwordVisible
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                    color: const Color(0xff8B8B8D),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 20),
                                  border: notificatitonPasswordText.isEmpty
                                      ? InputBorder.none
                                      : OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13.sp),
                                          borderSide: const BorderSide(
                                              width: 2, color: Colors.red),
                                        ),
                                  hintText: 'Nhập mật khẩu',
                                  hintStyle:
                                      const TextStyle(color: Color(0xff8B8B8D)),
                                  enabledBorder:
                                      notificatitonPasswordText.isEmpty
                                          ? InputBorder.none
                                          : OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13.sp),
                                              borderSide: const BorderSide(
                                                  width: 2, color: Colors.red),
                                            ),
                                  focusedBorder:
                                      notificatitonPasswordText.isEmpty
                                          ? InputBorder.none
                                          : OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13.sp),
                                              borderSide: const BorderSide(
                                                  width: 2, color: Colors.red),
                                            ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Padding(
                        padding: EdgeInsets.only(left: 18.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 4.sp,
                            ),
                            Text(
                              notificatitonPasswordText,
                              style: TextStyle(
                                color: const Color(0xFFF96F6F),
                                fontSize: 12.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
