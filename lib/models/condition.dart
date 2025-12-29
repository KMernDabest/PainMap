import 'body_part.dart';

class Condition {
  final int id;
  final String name ;
  final String description;
  final BodyPart bodyPart;
  final BodyArea bodyArea;
  final String? overview;
  final double? howCommon; // percentage
  final List<String>? relatedSymptoms;
  final List<String>? causes;
  final List<String>? riskFactors;
  final String? treatment;
  final String? selfCare;
  final List<String>? madeWorsBy;
  final List<String>? prevention;
  final String? whenToSeeDoctorMessage;
  final List<String>? questionsForDoctor;
  final String? whatToExpect;
  final String? didYouKnow;
  final Severity severity;
  final List<String> alternativeNames;

  Condition({
    required this.id,
    required this.name,
    required this.description,
    required this.bodyPart,
    required this.bodyArea,
    this.overview,
    this.howCommon,
    this.relatedSymptoms,
    this.causes,
    this.riskFactors,
    this.treatment,
    this.selfCare,
    this.madeWorsBy,
    this.prevention,
    this.whenToSeeDoctorMessage,
    this.questionsForDoctor,
    this.whatToExpect,
    this.didYouKnow,
    required this.severity,
    this.alternativeNames = const [],
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      bodyPart: BodyPart.values[json['bodyPart'] as int? ?? 0],
      bodyArea: BodyArea.values[json['bodyArea'] as int? ?? 0],
      overview: json['overview'] as String?,
      howCommon: (json['howCommon'] as num?)?.toDouble(),
      relatedSymptoms: List<String>.from(json['relatedSymptoms'] as List? ?? []),
      causes: List<String>.from(json['causes'] as List? ?? []),
      riskFactors: List<String>.from(json['riskFactors'] as List? ?? []),
      treatment: json['treatment'] as String?,
      selfCare: json['selfCare'] as String?,
      madeWorsBy: List<String>.from(json['madeWorsBy'] as List? ?? []),
      prevention: List<String>.from(json['prevention'] as List? ?? []),
      whenToSeeDoctorMessage: json['whenToSeeDoctorMessage'] as String?,
      questionsForDoctor: List<String>.from(json['questionsForDoctor'] as List? ?? []),
      whatToExpect: json['whatToExpect'] as String?,
      didYouKnow: json['didYouKnow'] as String?,
      severity: Severity.values[json['severity'] as int? ?? 1],
      alternativeNames: List<String>.from(json['alternativeNames'] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'overview': overview,
    'howCommon': howCommon,
    'relatedSymptoms': relatedSymptoms,
    'causes': causes,
    'riskFactors': riskFactors,
    'treatment': treatment,
    'selfCare': selfCare,
    'madeWorsBy': madeWorsBy,
    'prevention': prevention,
    'whenToSeeDoctorMessage': whenToSeeDoctorMessage,
    'questionsForDoctor': questionsForDoctor,
    'whatToExpect': whatToExpect,
    'didYouKnow': didYouKnow,
    'severity': severity.index,
    'alternativeNames': alternativeNames,
  };
}
