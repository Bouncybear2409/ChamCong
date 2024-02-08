import 'package:chamcong/data/network/api/api_call.dart';
import 'package:chamcong/pages/widgets/button.dart/employee_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AbsenceBlock extends StatefulWidget {
  const AbsenceBlock({super.key, required this.accessToken});
  final String? accessToken;
  @override
  State<AbsenceBlock> createState() => _AbsenceBlockState();
}

class _AbsenceBlockState extends State<AbsenceBlock> {
  List<String> leaveReasons = [
    'FAMILY',
    'Nghỉ phép 2',
    'Nghỉ phép 3',
    'Nghỉ phép 4'
  ];

  String selectedLeaveReason = 'FAMILY';
  // ignore: unused_field
  final formatter = DateFormat("dd-MM-yyyy");
  DateTime? startDate;
  DateTime? endDate;
  final TextEditingController otherReasonController = TextEditingController();

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
                                    ? 'MM-dd-yyyy'
                                    : formatter.format(startDate!),
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
                                    ? 'MM-dd-yyyy'
                                    : formatter.format(endDate!),
                                style: TextStyle(
                                  color: Color(0xFFECECF2),
                                  fontFamily: 'Roboto',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              IconButton(
                                onPressed: endtDatePicker,
                                icon: Icon(
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
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                decoration: ShapeDecoration(
                  color: Color.fromARGB(255, 243, 242, 242),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedLeaveReason,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Color.fromRGBO(13, 13, 14, 1)),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLeaveReason = newValue!;
                      });
                    },
                    items: leaveReasons.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              TextField(
                controller: otherReasonController,
                maxLines: null,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Color(0xFF2E2E2E)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFDADADA),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                  hintText: 'Lý do khác',
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
          EmployeeButton(
            onTap: () async {
              if (startDate != null &&
                  endDate != null &&
                  selectedLeaveReason.isNotEmpty &&
                  otherReasonController.text.isNotEmpty) {
                try {
                  // Call the createLeaveRequest API
                  await ApiCall.createLeaveRequest(
                    formatter.format(startDate!),
                    formatter.format(endDate!),
                    selectedLeaveReason,
                    otherReasonController.text,
                    widget.accessToken.toString(),
                    // Add otherReason if needed
                  );

                  // Show a success message or navigate to another screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Leave request sent successfully!'),
                    ),
                  );
                } catch (e) {
                  // Handle the error, show an error message, etc.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to send leave request. Error: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } else {
                // Show a message that all fields must be filled
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please fill in all fields'),
                    backgroundColor: Colors.yellow,
                  ),
                );
              }
            },
            text: 'Gửi đơn',
            color_button: const Color(0xFF279142),
            color_text: Colors.white,
          )
        ],
      ),
    );
  }
}
