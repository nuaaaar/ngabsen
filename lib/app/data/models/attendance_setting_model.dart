class AttendanceSetting {
  int? id;
  String? checkInStart;
  String? checkInEnd;
  String? checkOutStart;
  String? createdAt;
  String? updatedAt;

  AttendanceSetting(
      {this.id,
      this.checkInStart,
      this.checkInEnd,
      this.checkOutStart,
      this.createdAt,
      this.updatedAt});

  AttendanceSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    checkInStart = json['check_in_start'];
    checkInEnd = json['check_in_end'];
    checkOutStart = json['check_out_start'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['check_in_start'] = checkInStart;
    data['check_in_end'] = checkInEnd;
    data['check_out_start'] = checkOutStart;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
