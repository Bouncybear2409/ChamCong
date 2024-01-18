import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

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
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0.06,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 320,
                height: 105,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Xin chào, TRẦN NHÂN HIẾU',
                      style: TextStyle(
                        color: Color(0xFF595959),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.11,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Vị trí: Nhân viên',
                      style: TextStyle(
                        color: Color(0xFF595959),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.11,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Ca làm việc: 9:00 AM - 12:00 AM',
                      style: TextStyle(
                        color: Color(0xFF497F4E),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0.11,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 240,
                height: 240,
                child: AnalogClock(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3.0, color: Colors.black),
                      color: Colors.transparent,
                      shape: BoxShape.circle),
                  width: 240.0,
                  height: 240.0,
                  isLive: true,
                  hourHandColor: Colors.black,
                  minuteHandColor: Colors.black,
                  showSecondHand: true,
                  numberColor: Colors.black87,
                  showNumbers: true,
                  showAllNumbers: false,
                  textScaleFactor: 2,
                  showTicks: true,
                  showDigitalClock: true,
                  datetime: DateTime.now(),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour >= 12 ? 'PM' : 'AM'}',
                    style: const TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 0.11,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${_getDayOfWeek(DateTime.now().weekday)}, ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                    style: const TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 320,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    // Xử lý khi nhấn nút
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Chấm công',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0.06,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
