class User {
  bool? success;
  int? status;
  String? message;
  List<Data>? data;

  User({this.success, this.status, this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? username;
  String? password;
  String? firstName;
  String? lastName;
  String? email;
  Null? departmentName;
  String? phoneNumber;

  Data(
      {this.username,
      this.password,
      this.firstName,
      this.lastName,
      this.email,
      this.departmentName,
      this.phoneNumber});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    departmentName = json['department_name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['department_name'] = this.departmentName;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
