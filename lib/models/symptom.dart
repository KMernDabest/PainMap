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
      // diseases: (json['diseases'] as List<dynamic>?)
      //     ?.map((d) => Disease.fromJson(d as Map<String, dynamic>))
      //     .toList() ?? [],
      bodyPart: BodyPart.values.firstWhere(
        (bp) => bp.id == json['bodyPartId'] as int,
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    // "diseases": diseases.map((d) => d.toJson()).toList(),
    'bodyPartId': bodyPart.id,
  };

}