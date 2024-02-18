import 'package:chamcong/pages/widgets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderBlock extends StatelessWidget {
  const HeaderBlock({super.key, required this.accessToken});
  final String? accessToken;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Nhân viên IT',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      color: Colors.white,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 46, vertical: 14),
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
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Ca làm việc: ',
                          style: TextStyle(
                            color: Color(0xFF595959),
                            fontSize: 15.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: '09:00 AM - 06:00 PM',
                          style: TextStyle(
                            color: Color(0xFF595959),
                            fontSize: 15.sp,
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
    );
  }
}
