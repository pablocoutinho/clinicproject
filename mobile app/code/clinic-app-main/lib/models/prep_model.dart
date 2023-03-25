// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PrepModel {
  final String c_id;
  final String? u_id;

  final int? id;
  PrepModel({
    required this.c_id,
    this.u_id,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'c_id': c_id,
    };
  }

  factory PrepModel.fromMap(Map<String, dynamic> map) {
    return PrepModel(
      c_id: map['c_id'] as String,
      u_id: map['u_id'] ?? "",
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrepModel.fromJson(String source) =>
      PrepModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
