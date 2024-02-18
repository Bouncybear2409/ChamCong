import 'package:chamcong/pages/login/blocks/login_body.dart';
import 'package:chamcong/pages/login/blocks/login_logo.dart';
import 'package:chamcong/pages/widgets/background/background.dart';

import 'package:flutter/material.dart';
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
                LoginBody(
                  userType: widget.userType,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
