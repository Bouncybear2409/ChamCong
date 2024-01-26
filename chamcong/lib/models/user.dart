class UsersResponse {
  bool? success;
  int? status;
  String? message;
  List<Data>? data;

  UsersResponse({this.success, this.status, this.message, this.data});

  UsersResponse.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? passWord;
  String? firstName;
  String? lastName;
  String? email;
  bool? isAdmin;
  String? birthday;
  String? position;
  String? departmentName;
  String? describe;
  String? phoneNumber;

  Data(
      {this.userName,
      this.passWord,
      this.firstName,
      this.lastName,
      this.email,
      this.isAdmin,
      this.birthday,
      this.position,
      this.departmentName,
      this.describe,
      this.phoneNumber});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    passWord = json['passWord'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    isAdmin = json['isAdmin'];
    birthday = json['birthday'];
    position = json['position'];
    departmentName = json['departmentName'];
    describe = json['describe'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['passWord'] = this.passWord;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['isAdmin'] = this.isAdmin;
    data['birthday'] = this.birthday;
    data['position'] = this.position;
    data['departmentName'] = this.departmentName;
    data['describe'] = this.describe;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
