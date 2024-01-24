import 'package:chamcong/component/background/background.dart';
import 'package:chamcong/login/login_body.dart';
import 'package:chamcong/splash/splash.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
        title: const Text(
          'Đăng nhập',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Stack(
          children: [
            BackGround(),
            LoginBody(),
          ],
        ),
      ),
    );
  }
}
