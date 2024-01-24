import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpTextField extends StatefulWidget {
  final bool isCheck;
  final bool isError;
  final Function(bool) onIsCheckChanged; // Callback function
  final Function(String) onChanged;

  const OtpTextField({
    required this.isCheck,
    this.isError = false,
    required this.onIsCheckChanged,
    required this.onChanged, // Pass the callback function
    Key? key,
  }) : super(key: key);

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 30.sp,
      height: 30.sp,
      textStyle: TextStyle(
          fontSize: 20.sp,
          color: const Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20.sp),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8.sp),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    // void validCheck(s) {
    //   if (s == '222222') {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const NewPassword(),
    //       ),
    //     );
    //   }
    // }

    return Column(
      children: [
        Pinput(
          length: 6,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          crossAxisAlignment: CrossAxisAlignment.center,
          // validator: (s) {
          //   if (widget.isCheck) {
          //     return s == '222222' ? null : 'Mã OTP không đúng định dạng';
          //   } else {
          //     return null;
          //   }
          // },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) {
            bool newIsCheck = (pin.isNotEmpty);
            widget.onIsCheckChanged(
                newIsCheck); // Call the callback function with the new value
          },
          onChanged: (value) => widget.onChanged(value),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Visibility(
          visible: widget.isError,
          child: Text(
            'Mã OTP không đúng định dạng',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFF4747),
              fontSize: 14.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
