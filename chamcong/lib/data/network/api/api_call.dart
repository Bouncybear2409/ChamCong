import 'package:chamcong/data/network/api/api_url.dart';
import 'package:chamcong/data/models/absence.dart';
import 'package:chamcong/data/models/userloginresponse.dart';
import 'package:dio/dio.dart';

class ApiCall {
  static Dio dio = Dio();

  // static Future<CreateLeaveRequest> createLeaveRequest(
  //     String startDate, String endDate, String userType) async {
  //   try {
  //     final response = await dio.post(
  //       ApiUrl.login,
  //       data: {'email': email, 'password': password, 'user_type': userType},
  //     );

  //     if (response.statusCode == 201) {
  //       return UserLoginResponse.fromJson(response.data);
  //     } else {
  //       throw Exception('Failed to login');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to login. Error: $e');
  //   }
  // }

  static Future<UserLoginResponse> loginUser(
      String email, String password, String userType) async {
    try {
      final response = await dio.post(
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
