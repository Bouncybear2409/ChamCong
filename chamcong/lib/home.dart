import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
         child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
                 SizedBox(
                height: 60,
              ),
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
            ]
        ),
      ),
      )
    );
  }
}
