import 'package:chamcong/component/background/background.dart';
import 'package:chamcong/login/login_body.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
