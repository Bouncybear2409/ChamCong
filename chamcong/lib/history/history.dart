import 'package:chamcong/component/appbar/appbar.dart';

import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Lịch sử',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: AppbarComponent(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
    );
  }
}
