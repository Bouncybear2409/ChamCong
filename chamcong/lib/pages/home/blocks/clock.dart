import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(microseconds: 1000));
    _animation =
        Tween<double>(end: math.pi, begin: math.pi * 2).animate(_controller);
    _animation.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 99.sp,
                width: 200.sp,
                color: Colors.red,
              ),
              Divider(
                height: 2.sp,
                color: Colors.transparent,
              ),
              Stack(
                children: [
                  Container(
                    height: 99.sp,
                    width: 200.sp,
                    color: Colors.blue,
                  ),
                  AnimatedBuilder(
                      animation: _animation,
                      child: Container(
                        height: 100.sp,
                        color: Colors.yellow,
                        width: 200.sp,
                      ),
                      builder: (context, child) {
                        return Transform(
                          alignment: Alignment.topCenter,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.003)
                            ..rotateX(_animation.value),
                          child: child,
                        );
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
