
import 'package:chamcong/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String notificatitonText = '';

  bool checkCredentials(String password, String confirmPassword) {
    if (password.isEmpty || confirmPassword.isEmpty) {
      return false;
    } else {
      return password == confirmPassword;
    }
  }

  void validateLogin() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    bool isValidLogin = checkCredentials(password, confirmPassword);

    if (isValidLogin) {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      });
    } else {
      if (password.isEmpty || confirmPassword.isEmpty) {
        setState(() {
          notificatitonText = 'Vui lòng nhập đầy đủ thông tin.';
        });
      } else if (password.length < 8 || confirmPassword.length < 8) {
        setState(() {
          notificatitonText = 'Mật khẩu phải lớn hơn hoặc bằng 8';
        });
      } else {
        setState(() {
          notificatitonText = 'Mật khẩu không giống nhau!';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tạo mật khẩu mới',
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
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
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
                            controller: passwordController,
                            obscureText: true,
                            autofocus: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.sp),
                              hintText: 'Nhập mật khẩu mới',
                              hintStyle: const TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
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
                            controller: confirmPasswordController,
                            obscureText: true,
                            autofocus: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.sp),
                              hintText: 'Nhập lại mật khẩu',
                              hintStyle: const TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.sp),
                  Text(
                    notificatitonText,
                    style: const TextStyle(color: Colors.red),
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
                        backgroundColor: const Color(0xff69B293),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {
                        validateLogin();
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
            ],
          ),
        ),
      ),
    );
  }
}
