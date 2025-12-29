import 'body_part.dart';

class SymptomLog {
  final String id;
  final String symptomName;
  final BodyPart bodyPart;
  final BodyArea bodyArea;
  final DateTime dateLogged;
  final Severity? severity;
  final String? notes;
  final List<String>? selectedConditions;

  SymptomLog({
    required this.id,
    required this.symptomName,
    required this.bodyPart,
    required this.bodyArea,
    required this.dateLogged,
    this.severity,
    this.notes,
    this.selectedConditions,
  });

  factory SymptomLog.fromJson(Map<String, dynamic> json) {
    return SymptomLog(
      id: json['id'] as String,
      symptomName: json['symptomName'] as String,
      bodyPart: BodyPart.values[json['bodyPart'] as int? ?? 0],
      bodyArea: BodyArea.values[json['bodyArea'] as int? ?? 0],
      dateLogged: DateTime.parse(json['dateLogged'] as String),
      severity: json['severity'] != null ? Severity.values[json['severity'] as int] : null,
      notes: json['notes'] as String?,
      selectedConditions: List<String>.from(json['selectedConditions'] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'symptomName': symptomName,
    'bodyPart': bodyPart.index,
    'dateLogged': dateLogged.toIso8601String(),
    'severity': severity?.index,
    'notes': notes,
    'selectedConditions': selectedConditions,
  };
}
