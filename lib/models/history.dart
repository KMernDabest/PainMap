import 'package:painmap/models/disease.dart';
import 'package:painmap/services/symptom_matcher_service.dart';

class History {
  final String id;
  final DateTime dateLogged;
  final String diseaseName;
  final String? notes;

  History({
    required this.id,
    required this.dateLogged,
    required this.diseaseName,
    this.notes,
  });

  Disease? getDisease() {
    return SymptomMatcherService().findByName(diseaseName);
  }

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'] as String,
      dateLogged: DateTime.parse(json['dateLogged'] as String),
      diseaseName: json['diseaseName'] as String,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'dateLogged': dateLogged.toIso8601String(),
    'diseaseName': diseaseName,
    'notes': notes,
  };
}
