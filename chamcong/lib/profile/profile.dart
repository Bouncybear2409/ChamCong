

import 'package:chamcong/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF68B193),
        title: const Text(
          'Tài khoản',
          style: TextStyle(
            color: Color(0xFFF2F2F2),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
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
                          color: Color(0xFF2E2E2E),
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
                          color: Color(0xFF595959),
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Đăng xuất',
                        style: TextStyle(
                          color: Color(0xFFF96F6F),
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
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
