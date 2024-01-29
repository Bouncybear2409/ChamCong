import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HistoryItem extends StatelessWidget {
  HistoryItem(
      {super.key,
      required this.startDate,
      required this.endDate,
      required this.status});
  String startDate;
  String endDate;
  String status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      child: Container(
        width: 320.sp,
        height: 91.50.sp,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Color(0xFF454545),
          borderRadius: BorderRadius.circular(15),
          border: const Border(
            left: BorderSide(color: Color(0xFF598AEA)),
            top: BorderSide(color: Color(0xFF598AEA)),
            right: BorderSide(color: Color(0xFF598AEA)),
            bottom: BorderSide(width: 3, color: Color(0xFF598AEA)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ngày bắt đầu',
                                            style: TextStyle(
                                              color: Color(0xFFD9D9D9),
                                              fontSize: 8,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w300,
                                              height: 0,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            startDate,
                                            style: TextStyle(
                                              color: Color(0xFFECECF2),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 33),
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ngày kết thúc',
                                            style: TextStyle(
                                              color: Color(0xFFD9D9D9),
                                              fontSize: 8,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w300,
                                              height: 0,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            endDate,
                                            style: TextStyle(
                                              color: Color(0xFFECECF2),
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 17),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Giờ gửi đơn:',
                                style: TextStyle(
                                  color: Color(0xFFD9D9D9),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '  ',
                                style: TextStyle(
                                  color: Color(0xFFECECF2),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '09:30 AM',
                                style: TextStyle(
                                  color: Color(0xFFECECF2),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 26),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 26),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFF598AEA)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                status,
                                style: TextStyle(
                                  color: Color(0xFF598AEA),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
