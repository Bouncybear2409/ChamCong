class UserLoginResponse {
  bool? success;
  int? status;
  String? message;
  Data? data;

  UserLoginResponse({this.success, this.status, this.message, this.data});

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? refreshToken;
  Info? info;

  Data({this.accessToken, this.refreshToken, this.info});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Info {
  int? id;
  String? phoneNumber;
  String? email;
  String? firstName;
  String? lastName;
  String? userType;

  Info(
      {this.id,
      this.phoneNumber,
      this.email,
      this.firstName,
      this.lastName,
      this.userType});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_type'] = this.userType;
    return data;
  }
}
