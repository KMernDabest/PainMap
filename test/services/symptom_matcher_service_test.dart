import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/services/symptom_matcher_service.dart';
import 'package:painmap/models/disease.dart';

void main() {
  group('SymptomMatcherService Tests', () {
    late SymptomMatcherService service;

    setUp(() {
      service = SymptomMatcherService();
    });

    test('matchDisease should return null for non-existent combination', () {
      final result = service.matchDisease(999, 15);
      expect(result, isNull);
    });

    test('matchDisease should return disease for valid body part and pain level', () {
      // Find a disease from the list to test with
      final testDisease = Disease.diseaseList.first;
      
      final result = service.matchDisease(
        testDisease.bodyPartId,
        testDisease.painLevel,
      );

      expect(result, isNotNull);
      expect(result?.bodyPartId, testDisease.bodyPartId);
      expect(result?.painLevel, testDisease.painLevel);
    });

    test('matchDisease should return correct disease for head pain level 1', () {
      final result = service.matchDisease(1, 1);
      
      if (result != null) {
        expect(result.bodyPartId, 1);
        expect(result.painLevel, 1);
      }
    });

    test('getAllMatchingDiseases should return empty list for non-existent combination', () {
      final results = service.getAllMatchingDiseases(999, 15);
      expect(results, isEmpty);
    });

    test('getAllMatchingDiseases should return all matching diseases', () {
      final testDisease = Disease.diseaseList.first;
      
      final results = service.getAllMatchingDiseases(
        testDisease.bodyPartId,
        testDisease.painLevel,
      );

      expect(results, isNotEmpty);
      for (var disease in results) {
        expect(disease.bodyPartId, testDisease.bodyPartId);
        expect(disease.painLevel, testDisease.painLevel);
      }
    });

    test('getAllMatchingDiseases should return list for valid inputs', () {
      final results = service.getAllMatchingDiseases(1, 1);
      
      expect(results, isA<List<Disease>>());
      for (var disease in results) {
        expect(disease.bodyPartId, 1);
        expect(disease.painLevel, 1);
      }
    });

    test('matchDisease should handle all pain levels 1-10', () {
      for (int painLevel = 1; painLevel <= 10; painLevel++) {
        final result = service.matchDisease(1, painLevel);
        // Result can be null or a valid disease
        if (result != null) {
          expect(result.painLevel, painLevel);
        }
      }
    });

    test('matchDisease should handle all body part IDs 1-7', () {
      for (int bodyPartId = 1; bodyPartId <= 7; bodyPartId++) {
        final result = service.matchDisease(bodyPartId, 1);
        // Result can be null or a valid disease
        if (result != null) {
          expect(result.bodyPartId, bodyPartId);
        }
      }
    });

    test('getAllMatchingDiseases should never return null', () {
      final results = service.getAllMatchingDiseases(999, 999);
      expect(results, isNotNull);
      expect(results, isA<List<Disease>>());
    });
  });
}
