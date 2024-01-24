import 'package:chamcong/app_images.dart';
import 'package:chamcong/component/appbar/appbar.dart';
import 'package:chamcong/component/button.dart/button.dart';
import 'package:chamcong/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

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
          ),
        ),
        content: Text(
          'Bạn có chắc muốn đăng xuất!',
          style: TextStyle(
            color: const Color.fromARGB(255, 80, 80, 81),
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
                builder: (context) => const LoginPage(),
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
          'Tài khoản',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: const AppbarComponent(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 22.sp,
                ),
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
                  height: 15.sp,
                ),
                const SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Trần Nhân Hiếu',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                const SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Nhân viên IT',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.sp,
                ),
                Container(
                  width: 322.sp,
                  height: 90.sp,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.sp, 30.sp, 8.sp, 8.sp),
                        child: Column(
                          children: [
                            const Text(
                              'Email: moonlight@gmail.com',
                              style: TextStyle(
                                color: Color(0xFF595959),
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.13,
                              ),
                            ),
                            SizedBox(
                              height: 30.sp,
                            ),
                            const Text(
                              'Phone number: 0908998898',
                              style: TextStyle(
                                color: Color(0xFF595959),
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Phần nút ở bên phải
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF68B193),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            // Xử lý sự kiện khi nút được nhấn
                          },
                          child: const Text(
                            'Sửa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 25.sp),
                  child: SizedBox(
                    width: 320.sp,
                    height: 50.sp,
                    child: ButtonComponent(
                      onTap: logoutAlert,
                      text: 'Đăng xuất',
                      color_button: Colors.white,
                      color_text: Colors.red,
                    ),
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
