import 'package:chamcong/pages/absence/blocks/absences_block.dart';
import 'package:flutter/material.dart';

class Absence extends StatelessWidget {
  const Absence({super.key, required this.accessToken});
  final String? accessToken;
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
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: AbsenceBlock(
        accessToken: accessToken,
      ),
    );
  }
}
