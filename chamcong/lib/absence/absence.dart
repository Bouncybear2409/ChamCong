import 'package:chamcong/component/appbar/appbar.dart';
import 'package:chamcong/component/button.dart/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Absence extends StatefulWidget {
  const Absence({super.key});

  @override
  State<Absence> createState() => _AbsenceState();
}

class _AbsenceState extends State<Absence> {
  // ignore: unused_field
  DateTime? _selectedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Tạo đơn nghỉ phép',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: const AppbarComponent(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.sp, 26.sp, 16.sp, 16.sp),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Color(0xFF2E2E2E)),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFDADADA),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                hintText: 'Họ tên',
                hintStyle: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 14,
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
            SizedBox(height: 20.sp),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFDADADA),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                hintText: 'Vị trí',
                hintStyle: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 14,
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
              value: null,
              onChanged: (String? newValue) {},
              items: ['Giám đốc', 'Leader', 'Nhân viên', 'Culi', 'trum da den']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.sp),
            TextField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Color(0xFF2E2E2E)),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFDADADA),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                hintText: 'Số điện thoại',
                hintStyle: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 14,
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
            SizedBox(
              height: 20.sp,
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
                      Stack(children: [
                        TextField(
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(color: Color(0xFF2E2E2E)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFDADADA),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.sp),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(
                                Icons.calendar_month,
                              ),
                            ),
                          ],
                        ),
                      ]),
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
                      Stack(children: [
                        TextField(
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(color: Color(0xFF2E2E2E)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFDADADA),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.sp),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(
                                Icons.calendar_month,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.sp,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Color(0xFF2E2E2E)),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFDADADA),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                hintText: 'Lý do nghỉ phép',
                hintStyle: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 14,
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
            SizedBox(height: 40.sp),
            ButtonComponent(
              onTap: () {},
              text: 'Gửi đơn',
              color_button: const Color(0xFF279142),
              color_text: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
