import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/models/disease.dart';
import 'package:painmap/models/body_part.dart';

void main() {
  group('Disease Model Tests', () {
    test('Disease should be created with required fields', () {
      final disease = Disease(
        name: 'Test Disease',
        bodyPart: BodyPart.head,
        painLevel: 5,
        description: 'Test description',
      );

      expect(disease.name, 'Test Disease');
      expect(disease.bodyPart, BodyPart.head);
      expect(disease.painLevel, 5);
      expect(disease.description, 'Test description');
    });

    test('Disease should have correct toString representation', () {
      final disease = Disease(
        name: 'Test Disease',
        bodyPart: BodyPart.abdomen,
        painLevel: 7,
        description: 'Test description',
      );

      expect(disease.description, isNull);
      
      expect(disease.toString(), contains('Test Disease'));
      expect(disease.toString(), contains('ABDOMEN'));
      expect(disease.toString(), contains('7'));
    });
  });
}
