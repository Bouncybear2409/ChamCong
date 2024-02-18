import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginTextField extends StatefulWidget {
  LoginTextField(
      {super.key,
      required this.textEditingController,
      required this.notificatiton,
      this.hintText,
      this.passwordVisible});
  TextEditingController textEditingController;
  String notificatiton;
  String? hintText;
  bool? passwordVisible;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320.sp,
          height: 50.sp,
          decoration: ShapeDecoration(
            color: const Color.fromARGB(116, 88, 81, 81),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.sp, color: const Color(0xFF888888)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            children: [
              widget.passwordVisible == null
                  ? Expanded(
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        controller: widget.textEditingController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 20),
                          border: widget.notificatiton.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                          hintText: widget.hintText,
                          hintStyle: const TextStyle(color: Color(0xff8B8B8D)),
                          enabledBorder: widget.notificatiton.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                          focusedBorder: widget.notificatiton.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        controller: widget.textEditingController,
                        obscureText: widget.passwordVisible!,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.passwordVisible =
                                    !widget.passwordVisible!;
                              });
                            },
                            icon: widget.passwordVisible!
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            color: const Color(0xff8B8B8D),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 20),
                          border: widget.notificatiton.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                          hintText: 'Nhập mật khẩu',
                          hintStyle: const TextStyle(color: Color(0xff8B8B8D)),
                          enabledBorder: widget.notificatiton.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                          focusedBorder: widget.notificatiton.isEmpty
                              ? InputBorder.none
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13.sp),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.red),
                                ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        SizedBox(height: 5.sp),
        Padding(
          padding: EdgeInsets.only(left: 18.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 4.sp,
              ),
              Text(
                widget.notificatiton,
                style: TextStyle(
                  color: const Color(0xFFF96F6F),
                  fontSize: 12.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
