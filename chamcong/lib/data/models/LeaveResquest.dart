class LeaveRequest {
  bool? success;
  int? status;
  String? message;
  List<Data>? data;

  LeaveRequest({this.success, this.status, this.message, this.data});

  LeaveRequest.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? startDate;
  String? endDate;
  String? reason;
  String? status;
  String? rejectedReason;
  String? otherReason;

  Data(
      {this.email,
      this.startDate,
      this.endDate,
      this.reason,
      this.status,
      this.rejectedReason,
      this.otherReason});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    reason = json['reason'];
    status = json['status'];
    rejectedReason = json['rejected_reason'];
    otherReason = json['other_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['rejected_reason'] = this.rejectedReason;
    data['other_reason'] = this.otherReason;
    return data;
  }
}