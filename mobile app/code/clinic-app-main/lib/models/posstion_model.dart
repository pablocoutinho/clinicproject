import 'dart:convert';

class PossitionModel {
  final String possition;
  final int front;
  final int behind;
  PossitionModel({
    required this.possition,
    required this.front,
    required this.behind,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'possition': possition,
      'front': front,
      'behind': behind,
    };
  }

  factory PossitionModel.fromMap(Map<String, dynamic> map) {
    return PossitionModel(
      possition: map['possition'] as String,
      front: map['front'] as int,
      behind: map['behind'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PossitionModel.fromJson(String source) =>
      PossitionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
