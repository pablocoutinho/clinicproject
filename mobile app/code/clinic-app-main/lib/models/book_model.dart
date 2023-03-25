import 'dart:convert';

class BookModel {
  final String c_id;
  final String? u_id;
  final String date;
  final String? possition;
  final String? updated_at;
  final String? created_at;
  final int? id;
  BookModel({
    required this.c_id,
    this.u_id,
    required this.date,
    this.possition,
    this.updated_at,
    this.created_at,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'c_id': c_id,
      // 'u_id': u_id,
      'date': date,
      // 'possition': possition,
      // 'updated_at': updated_at,
      // 'created_at': created_at,
      //'id': id,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      c_id: map['c_id'] as String,
      u_id: map['u_id'] ?? "",
      date: map['date'] as String,
      possition: map['possition'] as String,
      updated_at: map['updated_at'] ?? "",
      created_at: map['created_at'] ?? "",
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(c_id: $c_id, u_id: $u_id, date: $date, possition: $possition, updated_at: $updated_at, created_at: $created_at, id: $id)';
  }
}
