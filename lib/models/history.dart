import 'package:painmap/models/disease.dart';
import 'package:painmap/models/symptom.dart';
import 'body_part.dart';

class History {
  final String id;
  final Symptom symptomName;
  final Disease disease;
  final BodyPart bodyPart;
  final DateTime dateLogged;
  final int? level;
  final String? notes;

  History({
    required this.id,
    required this.symptomName,
    required this.disease,
    required this.bodyPart,
    required this.dateLogged,
    this.level,
    this.notes
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'] as String,
      symptomName: Symptom.fromJson(json['symptomName'] as Map<String, dynamic>),
      disease: Disease.fromJson(json['disease'] as Map<String, dynamic>),
      bodyPart: BodyPart.fromJson(json['bodyPart'] as Map<String, dynamic>),
      dateLogged: DateTime.parse(json['dateLogged'] as String),
      level: json['level'] as int?,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'symptomName': symptomName,
    'bodyPart': bodyPart.toJson(),
    'dateLogged': dateLogged.toIso8601String(),
    'level': level,
    'notes': notes,
  };
}
