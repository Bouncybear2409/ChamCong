import 'package:chamcong/app_images.dart';
import 'package:chamcong/component/appbar/appbar.dart';

import 'package:chamcong/component/button.dart/button.dart';
import 'package:chamcong/home/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Chủ nhật';
      case 2:
        return 'Thứ 2';
      case 3:
        return 'Thứ 3';
      case 4:
        return 'Thứ 4';
      case 5:
        return 'Thứ 5';
      case 6:
        return 'Thứ 6';
      case 7:
        return 'Thứ 7';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Trang chủ',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: const AppbarComponent(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.sp, right: 15.sp),
                      child: Image(
                        image: const AssetImage(
                          AppImages.imgAvatar,
                        ),
                        height: 60.sp,
                        width: 60.sp,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trần Nhân Hiếu',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Text(
                          'Nhân viên IT',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.sp, bottom: 34.sp),
                    child: Container(
                      width: 320.sp,
                      height: 46.sp,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 46, vertical: 14),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F8B8B8B),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ca làm việc: ',
                                style: TextStyle(
                                  color: Color(0xFF595959),
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '09:00 AM - 06:00 PM',
                                style: TextStyle(
                                  color: Color(0xFF595959),
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Clock(),
          SizedBox(height: 20.sp),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour >= 12 ? 'PM' : 'AM'}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              SizedBox(height: 20.sp),
              Text(
                '${_getDayOfWeek(DateTime.now().weekday)}, ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: SizedBox(
              width: 320.sp,
              height: 50.sp,
              child: ButtonComponent(
                onTap: () {},
                text: 'Chấm công',
                color_button: const Color(0xFF279142),
                color_text: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
