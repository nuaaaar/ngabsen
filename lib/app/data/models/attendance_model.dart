class Attendance {
  int? id;
  int? userId;
  String? status;
  int? isLate;
  String? image;
  String? date;
  String? createdAt;
  String? updatedAt;

  Attendance(
      {this.id,
      this.userId,
      this.status,
      this.isLate,
      this.image,
      this.date,
      this.createdAt,
      this.updatedAt});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    isLate = json['is_late'];
    image = json['image'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['status'] = status;
    data['is_late'] = isLate;
    data['image'] = image;
    data['date'] = date;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
