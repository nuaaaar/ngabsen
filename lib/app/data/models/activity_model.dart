class Activity {
  int? id;
  int? userId;
  String? descriptions;
  String? createdAt;
  String? updatedAt;

  Activity(
      {this.id,
      this.userId,
      this.descriptions,
      this.createdAt,
      this.updatedAt});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    descriptions = json['descriptions'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['descriptions'] = descriptions;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
