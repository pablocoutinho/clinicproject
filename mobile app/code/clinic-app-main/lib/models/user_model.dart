import 'dart:convert';

class UserModel {
  final int? id;
  final String name;
  final String email;
  final String? password;
  final String surName;
  final String dateOfBirth;
  final String phone;
  final String? patientNo;
  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.password,
    required this.surName,
    required this.dateOfBirth,
    required this.phone,
    this.patientNo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'surName': surName,
      'dateOfBirth': dateOfBirth,
      'phone': phone,
      'patientNo': patientNo,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      // password: map['password'] as String,
      surName: map['surName'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      phone: map['phone'] as String,
      patientNo: map['patientNo'] != null ? map['patientNo'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password, surName: $surName, dateOfBirth: $dateOfBirth, phone: $phone, patientNo: $patientNo)';
  }
}
