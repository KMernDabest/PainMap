import 'package:painmap/models/disease.dart';
import 'package:painmap/repo/disease_list.dart';

class History {
  final String id;
  final String diseaseName;
  final DateTime dateLogged;
  final int? level;
  final String? notes;

  History({
    required this.id,
    required this.diseaseName,
    required this.dateLogged,
    this.level,
    this.notes,
  });

  // Get disease object from repository by name
  Disease? getDisease() {
    return DiseaseRepository.findByName(diseaseName);
  }

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'] as String,
      diseaseName: json['diseaseName'] as String,
      dateLogged: DateTime.parse(json['dateLogged'] as String),
      level: json['level'] as int?,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'diseaseName': diseaseName,
    'dateLogged': dateLogged.toIso8601String(),
    'level': level,
    'notes': notes,
  };
}
