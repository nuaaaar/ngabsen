class Attendance {
  int? id;
  int? userId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Attendance(
      {this.id, this.userId, this.status, this.createdAt, this.updatedAt});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
