import 'package:ngabsen/app/data/models/attendance_model.dart';

class User {
  int? id;
  String? nama;
  String? app;
  String? jenisKelamin;
  String? alamat;
  String? nik;
  String? username;
  String? fotoDiri;
  String? createdAt;
  String? updatedAt;
  Attendance? todayCheckIn;
  Attendance? todayCheckOut;

  User(
      {this.id,
      this.nama,
      this.app,
      this.jenisKelamin,
      this.alamat,
      this.nik,
      this.username,
      this.fotoDiri,
      this.createdAt,
      this.updatedAt,
      this.todayCheckIn,
      this.todayCheckOut});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    app = json['app'];
    jenisKelamin = json['jenis_kelamin'];
    alamat = json['alamat'];
    nik = json['nik'];
    username = json['username'];
    fotoDiri = json['foto_diri'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    todayCheckIn = json['today_check_in'] != null
        ? Attendance?.fromJson(json['today_check_in'])
        : null;
    todayCheckOut = json['today_check_out'] != null
        ? Attendance?.fromJson(json['today_check_out'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['app'] = app;
    data['jenis_kelamin'] = jenisKelamin;
    data['alamat'] = alamat;
    data['nik'] = nik;
    data['username'] = username;
    data['foto_diri'] = fotoDiri;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (todayCheckIn != null) {
      data['today_check_in'] = todayCheckIn!.toJson();
    }
    if (todayCheckOut != null) {
      data['today_check_out'] = todayCheckOut!.toJson();
    }
    return data;
  }
}

class TodayCheckIn {
  int? id;
  int? userId;
  String? status;
  String? createdAt;
  String? updatedAt;

  TodayCheckIn(
      {this.id, this.userId, this.status, this.createdAt, this.updatedAt});

  TodayCheckIn.fromJson(Map<String, dynamic> json) {
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
