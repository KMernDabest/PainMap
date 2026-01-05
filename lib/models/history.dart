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
    this.notes,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'] as String,
      symptomName: Symptom.symptomList.firstWhere(
        (symptom) => symptom.id == json['symptomId'] as int,
        orElse: () => Symptom.symptomList.first,
      ),
      disease: Disease.diseaseList.firstWhere(
        (disease) => disease.id == json['diseaseId'] as int,
        orElse: () => Disease.diseaseList.first,
      ),
      bodyPart: BodyPart.values.firstWhere(
        (bp) => bp.id == json['bodyPartId'] as int,
        orElse: () => BodyPart.values.first,
      ),
      dateLogged: DateTime.parse(json['dateLogged'] as String),
      level: json['level'] as int?,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'symptomId': symptomName.id,
    'diseaseId': disease.id,
    'bodyPartId': bodyPart.id,
    'dateLogged': dateLogged.toIso8601String(),
    'level': level,
    'notes': notes,
  };
}
