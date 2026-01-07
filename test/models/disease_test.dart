import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/models/disease.dart';

void main() {
  group('Disease Model Tests', () {
    test('Disease should be created with required fields', () {
      final disease = Disease(
        id: 1,
        painLevel: 5,
        name: 'Test Disease',
        bodyPartId: 1,
        description: 'Test description',
        symptomDetails: 'Test symptoms',
      );

      expect(disease.id, 1);
      expect(disease.painLevel, 5);
      expect(disease.name, 'Test Disease');
      expect(disease.bodyPartId, 1);
      expect(disease.description, 'Test description');
      expect(disease.symptomDetails, 'Test symptoms');
    });

    test('Disease should handle optional fields as null', () {
      final disease = Disease(
        id: 1,
        painLevel: 5,
        name: 'Test Disease',
        bodyPartId: 1,
      );

      expect(disease.description, isNull);
      expect(disease.symptomDetails, isNull);
    });

    test('fromId should return correct body part name', () {
      final disease = Disease(
        id: 1,
        painLevel: 5,
        name: 'Test Disease',
        bodyPartId: 1,
      );

      expect(disease.fromId(1), 'Head');
      expect(disease.fromId(2), 'Left Arm');
      expect(disease.fromId(3), 'Right Arm');
      expect(disease.fromId(4), 'Abdomen');
      expect(disease.fromId(5), 'Left Leg');
      expect(disease.fromId(6), 'Right Leg');
      expect(disease.fromId(7), 'Back');
      expect(disease.fromId(99), 'Unknown');
    });

    test('diseaseList should not be empty', () {
      expect(Disease.diseaseList, isNotEmpty);
      expect(Disease.diseaseList.length, greaterThan(0));
    });

    test('diseaseList should contain valid disease objects', () {
      for (var disease in Disease.diseaseList) {
        expect(disease.id, isPositive);
        expect(disease.painLevel, inInclusiveRange(1, 10));
        expect(disease.name, isNotEmpty);
        expect(disease.bodyPartId, inInclusiveRange(1, 7));
      }
    });

    test('should find diseases by body part', () {
      final headDiseases = Disease.diseaseList
          .where((d) => d.bodyPartId == 1)
          .toList();
      
      expect(headDiseases, isNotEmpty);
      for (var disease in headDiseases) {
        expect(disease.bodyPartId, 1);
      }
    });

    test('should find diseases by pain level', () {
      final severeDiseases = Disease.diseaseList
          .where((d) => d.painLevel >= 8)
          .toList();
      
      expect(severeDiseases, isNotEmpty);
      for (var disease in severeDiseases) {
        expect(disease.painLevel, greaterThanOrEqualTo(8));
      }
    });
  });
}
