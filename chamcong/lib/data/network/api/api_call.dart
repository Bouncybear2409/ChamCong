import 'dart:convert';

import 'package:chamcong/data/network/api/api_url.dart';
import 'package:chamcong/data/models/absence.dart';
import 'package:chamcong/data/models/userloginresponse.dart';
import 'package:chamcong/data/network/api/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:localstorage/localstorage.dart';

class ApiCall {
  static Dio dio = Dio();

  Future<void> fetchUserInfo(String accessToken) async {
    // Khởi tạo local storage
    final LocalStorage storage = LocalStorage('accessToken');

    // Đọc token từ local storage
    await storage.ready;
    String userToken = storage.getItem('accessToken') ?? '';

    try {
      // Gửi yêu cầu với token
      var response = await dio.get(
        'https://your-backend-api.com/user-info',
        options: Options(
          headers: {'Authorization': 'Bearer $userToken'},
        ),
      );

      // Kiểm tra trạng thái của yêu cầu
      if (response.statusCode == 200) {
        // Xử lý dữ liệu trả về từ backend
        var userData = json.decode(response.data.toString());
        print('Thông tin người dùng: $userData');
      } else {
        // Xử lý lỗi nếu có
        print('Lỗi khi gửi yêu cầu đến backend: ${response.statusCode}');
      }
    } catch (error) {
      // Xử lý lỗi nếu có
      print('Lỗi: $error');
    }
  }

  static Future<UserLoginResponse> loginUser(
      String email, String password, String userType) async {
    try {
      final response = await Api().post(
        ApiUrl.login,
        data: {'email': email, 'password': password, 'user_type': userType},
      );

      if (response.statusCode == 201) {
        return UserLoginResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login. Error: $e');
    }
  }

  static Future<Response> createLeaveRequest(String startDate, String endDate,
      String reason, String otherReason, String token) async {
    Api().setHeaderToken(
      token: token,
    );
    try {
      final response = await Api().post(
        ApiUrl.createLeaveRequest,
        data: {
          'start_date': startDate,
          'end_date': endDate,
          'reason': reason,
          'other_reason': otherReason
        },
        hasToken: true,
      );

      if (response.statusCode == 201) {
        return response;
      } else {
        throw Exception('Failed to create leave request');
      }
    } catch (e) {
      throw Exception('Failed to create leave request. Error: $e');
    }
  }

  static Future<List<AbsenceResponse>> fetchAbsenceAPI() async {
    // var response = await dio.get(ApiUrl.absenceReport);
    // final List<dynamic> responseData = response.data;
    final List<Map<String, dynamic>> test = [
      {
        "leaveRequestId": "leaveRequestId",
        "userId": "userId",
        "startDate": "1/2/2004",
        "endDate": "8/10/2004",
        "reason": "reason 123123",
        "status": "Chờ duyệt",
        "rejectedReason": "rejectedReason",
        "remainingDay": "remainingDay"
      },
      {
        "leaveRequestId": "leaveRequestId",
        "userId": "userId",
        "startDate": "4/9/2005",
        "endDate": "20/11/2005",
        "reason": "reason 123123",
        "status": "Đã duyệt",
        "rejectedReason": "rejectedReason",
        "remainingDay": "remainingDay"
      },
    ];
    List<AbsenceResponse> absences =
        test.map((json) => AbsenceResponse.fromJson(json)).toList();
    return absences;
  }
}
