import 'body_part.dart';

class Disease {
  final String name;
  final BodyPart bodyPart;
  final int painLevel;
  final String description;

  const Disease({
    required this.name,
    required this.bodyPart,
    required this.painLevel,
    required this.description,
  });
}