import 'package:chamcong/api/api_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCall extends StatelessWidget {
  const ApiCall({super.key});

  Future<List<dynamic>> fetchAPI() async {
    Dio dio = Dio();

    var response = await dio.get(ApiUrl.absenceReport);

    return response.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: fetchAPI(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
