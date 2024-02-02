import 'package:chamcong/data/network/api/api_call.dart';
import 'package:chamcong/data/models/userloginresponse.dart';
import 'package:chamcong/pages/slpash/splash_page.dart';
import 'package:chamcong/pages/widgets/app_color.dart';
import 'package:chamcong/pages/widgets/app_images.dart';
import 'package:chamcong/pages/widgets/button.dart/button.dart';
import 'package:chamcong/pages/bottomBar/bottom_bar.dart';
import 'package:chamcong/pages/forgot_password/email_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localstorage/localstorage.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key, required this.userType});
  final String userType;
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

final LocalStorage storage = new LocalStorage('access_token');

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

  void NavigateSplash() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Splash(),
      ),
    );
  }

  // bool checkCredentials(String username, String password) {
  //   return username == 'user@gmail.com' && password == 'password';
  // }

  Future<void> validateLogin() async {
    String username = usernameController.text;
    String password = passwordController.text;

    // bool isValidLogin = checkCredentials(username, password);
    try {
      if (username.isEmpty) {
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
        notificatitonUserText = '';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 91.sp),
          child: Image.asset(AppImages.imgLogo),
        ),
        Container(
          height: 430.sp,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(255, 43, 39, 39),
              border: Border.all(
                color: const Color.fromARGB(255, 20, 20, 20),
              ),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Column(
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Row(
                  children: [
                    InkWell(
                      onTap: NavigateSplash,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 90.sp,
                    ),
                    Text(
                      'Đăng nhập',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 31.sp,
              ),
              Container(
                width: 320.sp,
                height: 50.sp,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(116, 88, 81, 81),
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: 1.sp, color: const Color(0xFF888888)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: usernameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 20),
                          border: notificatitonUserText.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                          hintText: 'Nhập email',
                          enabledBorder: notificatitonUserText.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                          focusedBorder: notificatitonUserText.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.sp),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 4.sp,
                  ),
                  Text(
                    notificatitonUserText,
                    style: TextStyle(
                      color: Color(0xFFF96F6F),
                      fontSize: 12.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Container(
                width: 320.sp,
                height: 50.sp,
                decoration: ShapeDecoration(
                  color: Color.fromARGB(116, 88, 81, 81),
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: 1.sp, color: const Color(0xFF888888)),
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(color: Colors.black),
                        controller: passwordController,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(Icons.remove_red_eye)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 20),
                          border: notificatitonPasswordText.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                          hintText: 'Nhập mật khẩu',
                          enabledBorder: notificatitonPasswordText.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                          focusedBorder: notificatitonPasswordText.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13.sp),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 4.sp,
                  ),
                  Text(
                    notificatitonPasswordText,
                    style: TextStyle(
                      color: Color(0xFFF96F6F),
                      fontSize: 12.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
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
                          color: const Color(0xFF497F4E),
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
              SizedBox(height: 39.sp),
              ButtonComponent(
                onTap: validateLogin,
                text: 'Đăng nhập',
                color_button: Color(0xFF279142),
                color_text: Colors.white,
              )
            ],
          ),
        ),
      ],
    );
  }
}
