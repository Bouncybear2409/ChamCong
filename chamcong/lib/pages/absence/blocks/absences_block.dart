import 'package:chamcong/pages/widgets/button.dart/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AbsenceBlock extends StatefulWidget {
  const AbsenceBlock({super.key});

  @override
  State<AbsenceBlock> createState() => _AbsenceBlockState();
}

class _AbsenceBlockState extends State<AbsenceBlock> {
  // ignore: unused_field
  final formatter = DateFormat.yMd();
  DateTime? startDate;
  DateTime? endDate;
  void startDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      startDate = pickedDate;
    });
  }

  void endtDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      endDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.sp, 26.sp, 16.sp, 16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 5.sp,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ngày bắt đầu',
                          style: TextStyle(
                            color: Color(0xFF595959),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        Container(
                          width: 150.sp,
                          height: 50.sp,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.sp, vertical: 12.sp),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFF454545),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                startDate == null
                                    ? 'Unselected'
                                    : formatter.format(startDate!),
                                style: TextStyle(
                                  color: Color(0xFFECECF2),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              IconButton(
                                onPressed: startDatePicker,
                                icon: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.sp,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ngày kết thúc',
                          style: TextStyle(
                            color: Color(0xFF595959),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        Container(
                          width: 150.sp,
                          height: 50.sp,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.sp, vertical: 12.sp),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFF454545),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                endDate == null
                                    ? 'Unselected'
                                    : formatter.format(endDate!),
                                style: TextStyle(
                                  color: Color(0xFFECECF2),
                                  fontFamily: 'Roboto',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              IconButton(
                                onPressed: startDatePicker,
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 18.sp,
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
              SizedBox(
                height: 20.sp,
              ),
              TextField(
                maxLines: null,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Color(0xFF2E2E2E)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFDADADA),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                  hintText: 'Lý do nghỉ phép',
                  hintStyle: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          ButtonComponent(
            onTap: () {},
            text: 'Gửi đơn',
            color_button: const Color(0xFF279142),
            color_text: Colors.white,
          )
        ],
      ),
    );
  }
}
