import 'condition.dart';
import 'body_part.dart';


class Symptom {
  final int id;
  final String name;
  final BodyPart bodyPart;
  final BodyArea bodyArea;
  final String description;
  final String? detail;
  final List<String>? relatedSymptoms;
  final List<Condition> possibleConditions;
  final List<String> alternativeNames;

  Symptom({
    required this.id,
    required this.name,
    required this.bodyPart,
    required this.bodyArea,
    required this.description,
    this.detail,
    this.relatedSymptoms,
    required this.possibleConditions,
    this.alternativeNames = const [],
  });

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      id: json['id'] as int,
      name: json['name'] as String,
      bodyPart: BodyPart.values[json['bodyPart'] as int? ?? 0],
      bodyArea: BodyArea.values[json['bodyArea'] as int? ?? 0],
      description: json['description'] as String,
      detail: json['detail'] as String?,
      relatedSymptoms: List<String>.from(json['relatedSymptoms'] as List? ?? []),
      possibleConditions: (json['possibleConditions'] as List?)
          ?.map((c) => Condition.fromJson(c as Map<String, dynamic>))
          .toList() ?? [],
      alternativeNames: List<String>.from(json['alternativeNames'] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'bodyPart': bodyPart.index,
    'description': description,
    'detail': detail,
    'relatedSymptoms': relatedSymptoms,
    'possibleConditions': possibleConditions.map((c) => c.toJson()).toList(),
    'alternativeNames': alternativeNames,
  };

  List<String> getAllAlternativeNames() {
    return [name, ...alternativeNames];
  }
}
