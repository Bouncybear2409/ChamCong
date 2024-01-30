import 'package:chamcong/pages/widgets/background/background.dart';
import 'package:chamcong/pages/login/blocks/login_body.dart';
import 'package:chamcong/pages/slpash/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.userType}) : super(key: key);
  final String userType;
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    void NavigateSplash() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Splash(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 243, 241, 241),
        ),
        leading: InkWell(
          onTap: NavigateSplash,
          child: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Đăng nhập',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            const BackGround(),
            LoginBody(userType: userType),
          ],
        ),
      ),
    );
  }
}
