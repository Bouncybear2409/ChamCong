import 'package:chamcong/component/appbar/appbar.dart';
import 'package:flutter/material.dart';

class Absence extends StatelessWidget {
  const Absence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Tạo Đơn nghỉ',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: AppbarComponent(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
    );
  }
}
