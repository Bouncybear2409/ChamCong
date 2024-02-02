import 'dart:convert';
import 'dart:ffi';

import 'package:chamcong/pages/slpash/splash_page.dart';
import 'package:chamcong/pages/widgets/app_images.dart';
import 'package:chamcong/pages/widgets/button.dart/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.userType});
  final String userType;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void logoutAlert() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          'Đăng xuất',
          style: TextStyle(
              fontSize: 24.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
        content: Text(
          'Bạn có chắc muốn đăng xuất!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text(
              'Quay lại',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Splash(),
              ),
            ),
            child: const Text(
              'Đăng xuất',
              style: TextStyle(
                color: Color(0xffF96F6F),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Tài khoản cá nhân',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 150.sp,
                    height: 150.sp,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.imgAvatarProfile),
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Đổi ảnh đại diện',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.sp, left: 20.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 161.sp,
                          height: 30.sp,
                          child: Text(
                            'Thông tin cá nhân',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    width: 320.sp,
                    height: 315.sp,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFF454545),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x33888888),
                          blurRadius: 20,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly, //chỉnh đều cho chữ, main: đi theo chiều thuận, cross: đi theo chiều nghịch
                        children: [
                          Text(
                            'hoangkimchi0590@gmail.com',
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 14.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Text(
                            '14/01/2003',
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 14.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '0934699436',
                                  style: TextStyle(
                                    color: Color(0xFF888888),
                                    fontSize: 14.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: Color(0xFF888888),
                                    fontSize: 16.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '(Số điện thoại)',
                                  style: TextStyle(
                                    color: Color(0xFF888888),
                                    fontSize: 12.sp,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 280.sp,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.sp,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF888888),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hoàng Kim Chi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              Image(
                                image: AssetImage(AppImages.imgPen),
                                color: Colors.white,
                              )
                            ],
                          ),
                          Container(
                            width: 280.sp,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.sp,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF888888),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '079303001024 ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(CCCD)',
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 12.sp,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image(
                                image: AssetImage(AppImages.imgPen),
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Container(
                            width: 280.sp,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.sp,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF888888),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'BA ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(Vị trí)',
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 12.sp,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image(
                                image: AssetImage(AppImages.imgDownArrow),
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Container(
                            width: 280.sp,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.sp,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF888888),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nữ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              Image(
                                image: AssetImage(AppImages.imgDownArrow),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                width: 320.sp,
                height: 105.sp,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFF454545),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.sp),
                      child: Row(
                        children: [
                          Image(image: AssetImage(AppImages.imgLockin)),
                          SizedBox(
                            width: 20.sp,
                          ),
                          Text(
                            'Đổi mật khẩu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 280.sp,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF888888),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.sp),
                      child: InkWell(
                        onTap: logoutAlert,
                        child: Row(
                          children: [
                            Image(image: AssetImage(AppImages.imgLogout)),
                            SizedBox(
                              width: 20.sp,
                            ),
                            Text(
                              'Đăng xuất',
                              style: TextStyle(
                                color: Color(0xFFFF4747),
                                fontSize: 14.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
