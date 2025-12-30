import 'body_part.dart';
import './disease.dart';


class Symptom {
  final int id;
  final String name;
  final List<Disease> diseases;
  final BodyPart bodyPart;
  
  Symptom({
    required this.id,
    required this.name,
    required this.bodyPart,
    this.diseases = const [],
  });

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      id: json['id'] as int,
      name: json['name'] as String,
      bodyPart: BodyPart.fromJson(json['bodyPart'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'bodyPart': bodyPart.toJson(),
  };


}
