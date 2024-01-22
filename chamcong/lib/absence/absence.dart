import 'package:chamcong/component/appbar/appbar.dart';
import 'package:chamcong/component/button.dart/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Absence extends StatelessWidget {
  const Absence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Tạo Đơn nghỉ',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: const AppbarComponent(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.sp, 32.sp, 16.sp, 16.sp),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
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
              style: const TextStyle(color: Colors.white),
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFDADADA),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                      hintText: 'Nhập email',
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
                ),
                SizedBox(
                  width: 16.sp,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFDADADA),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                      hintText: 'Nhập email',
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
                ),
              ],
            ),
            SizedBox(
              height: 20.sp,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
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
            SizedBox(height: 50.sp),
            ButtonComponent(
              Function: () {},
              text: 'Gửi đơn',
            )
          ],
        ),
      ),
    );
  }
}
