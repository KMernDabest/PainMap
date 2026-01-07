import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/models/symptom.dart';
import 'package:painmap/models/body_part.dart';

void main() {
  group('Symptom Model Tests', () {
    test('Symptom should be created with required fields', () {
      final symptom = Symptom(
        id: 1,
        name: 'Headache',
        bodyPart: BodyPart.head,
        diseasesId: [],
      );

      expect(symptom.id, 1);
      expect(symptom.name, 'Headache');
      expect(symptom.bodyPart, BodyPart.head);
      expect(symptom.diseasesId, isEmpty);
    });

    test('Symptom should handle empty diseasesId by default', () {
      final symptom = Symptom(
        id: 1,
        name: 'Headache',
        bodyPart: BodyPart.head,
      );

      expect(symptom.diseasesId, isEmpty);
    });

    test('symptomList should not be empty', () {
      expect(Symptom.symptomList, isNotEmpty);
      expect(Symptom.symptomList.length, greaterThan(0));
    });

    test('symptomList should contain valid symptom objects', () {
      for (var symptom in Symptom.symptomList) {
        expect(symptom.id, isPositive);
        expect(symptom.name, isNotEmpty);
        expect(BodyPart.values, contains(symptom.bodyPart));
      }
    });

    test('should find symptoms by body part', () {
      final headSymptoms = Symptom.symptomList
          .where((s) => s.bodyPart == BodyPart.head)
          .toList();
      
      expect(headSymptoms, isNotEmpty);
      for (var symptom in headSymptoms) {
        expect(symptom.bodyPart, BodyPart.head);
      }
    });

    test('all body parts should have associated symptoms', () {
      for (var bodyPart in BodyPart.values) {
        final symptoms = Symptom.symptomList
            .where((s) => s.bodyPart == bodyPart)
            .toList();
        
        expect(symptoms, isNotEmpty,
            reason: 'Body part ${bodyPart.name} should have symptoms');
      }
    });

    test('symptom IDs should be unique', () {
      final ids = Symptom.symptomList.map((s) => s.id).toSet();
      expect(ids.length, Symptom.symptomList.length,
          reason: 'All symptom IDs should be unique');
    });
  });
}
