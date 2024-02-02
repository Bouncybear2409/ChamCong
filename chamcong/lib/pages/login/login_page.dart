import 'package:chamcong/pages/widgets/background/background.dart';
import 'package:chamcong/pages/login/blocks/login_body.dart';
import 'package:chamcong/pages/slpash/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key, required this.userType}) : super(key: key);
  late String userType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
