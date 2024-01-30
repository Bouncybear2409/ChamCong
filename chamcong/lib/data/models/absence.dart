class AbsenceResponse {
  String? leaveRequestId;
  String? userId;
  String? startDate;
  String? endDate;
  String? reason;
  String? status;
  String? rejectedReason;
  String? remainingDay;

  AbsenceResponse(
      {this.leaveRequestId,
      this.userId,
      this.startDate,
      this.endDate,
      this.reason,
      this.status,
      this.rejectedReason,
      this.remainingDay});

  AbsenceResponse.fromJson(Map<String, dynamic> json) {
    leaveRequestId = json['leaveRequestId'];
    userId = json['userId'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    reason = json['reason'];
    status = json['status'];
    rejectedReason = json['rejectedReason'];
    remainingDay = json['remainingDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveRequestId'] = this.leaveRequestId;
    data['userId'] = this.userId;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['rejectedReason'] = this.rejectedReason;
    data['remainingDay'] = this.remainingDay;
    return data;
  }
}
