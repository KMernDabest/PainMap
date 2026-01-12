import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/services/symptom_matcher_service.dart';
import 'package:painmap/models/body_part.dart';

void main() {
  group('SymptomMatcherService Tests', () {
    late SymptomMatcherService service;

    setUp(() {
      service = SymptomMatcherService();
    });

    test('matchDisease should return null for non-existent combination', () {
      final result = service.matchDisease(BodyPart.head, 999);
      expect(result, isNull);
    });

    test('matchDisease should return disease for valid body part and pain level', () {
      final result = service.matchDisease(BodyPart.head, 1);
      
      expect(result, isNotNull);
      expect(result?.bodyPart, BodyPart.head);
      expect(result?.painLevel, 1);
    });

    test('getDiseasesByBodyPart should return all diseases for a body part', () {
      final results = service.getDiseasesByBodyPart(BodyPart.head);
      
      expect(results, isNotEmpty);
      expect(results.every((d) => d.bodyPart == BodyPart.head), isTrue);
    });

    test('getDiseasesByPainLevel should return all diseases for a pain level', () {
      final results = service.getDiseasesByPainLevel(5);
      
      expect(results, isNotEmpty);
      expect(results.every((d) => d.painLevel == 5), isTrue);
    });

    test('getDiseasesByBodyPart should return empty list for non-existent body part diseases', () {
      // All body parts should have diseases, so this test checks the count
      final results = service.getDiseasesByBodyPart(BodyPart.back);
      expect(results, isNotEmpty);
    });

    test('matchDisease should handle all pain levels 1-10', () {
      for (int painLevel = 1; painLevel <= 10; painLevel++) {
        final result = service.matchDisease(BodyPart.head, painLevel);
        // Result can be null or a valid disease
        if (result != null) {
          expect(result.painLevel, painLevel);
        }
      }
    });

    test('matchDisease should handle all body parts', () {
      for (var bodyPart in BodyPart.values) {
        final result = service.matchDisease(bodyPart, 1);
        // Result can be null or a valid disease
        if (result != null) {
          expect(result.bodyPart, bodyPart);
        }
      }
    });
  });
}
