import 'body_part.dart';

class Disease {
  final String name;
  final BodyPart bodyPart;
  final int painLevel;
  final String description;

  Disease({
    required this.name,
    required this.bodyPart,
    required this.painLevel,
    required this.description,
  });

  @override
  String toString() => 'Disease(name: $name, bodyPart: $bodyPart, painLevel: $painLevel, description: $description)';
}
