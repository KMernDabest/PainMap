import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/models/history.dart';

void main() {
  group('History Model Tests', () {
    late History testHistory;
    late DateTime testDate;
    final testDiseaseName = "Mild Sinus Pressure";

    setUp(() {
      testDate = DateTime(2026, 1, 7, 10, 30);
      testHistory = History(
        id: 'test-id-123',
        dateLogged: testDate,
        diseaseName: testDiseaseName,
        notes: 'Test notes',
      );
    });

    test('History should be created with all fields', () {
      expect(testHistory.id, 'test-id-123');
      expect(testHistory.diseaseName, testDiseaseName);
      expect(testHistory.dateLogged, testDate);
      expect(testHistory.notes, 'Test notes');
    });

    test('History should handle optional fields as null', () {
      final historyNoOptionals = History(
        id: 'test-id-456',
        dateLogged: testDate,
        diseaseName: testDiseaseName,
      );

      expect(historyNoOptionals.notes, isNull);
    });

    test('getDisease should return correct Disease from repository', () {
      final disease = testHistory.getDisease();
      
      expect(disease, isNotNull);
      expect(disease?.name, testDiseaseName);
    });

    test('toJson should convert History to Map correctly', () {
      final json = testHistory.toJson();

      expect(json['id'], 'test-id-123');
      expect(json['diseaseName'], testDiseaseName);
      expect(json['dateLogged'], testDate.toIso8601String());
      expect(json['notes'], 'Test notes');
    });

    test('fromJson should create History from Map correctly', () {
      final json = {
        'id': 'test-id-789',
        'diseaseName': testDiseaseName,
        'dateLogged': testDate.toIso8601String(),
        'notes': 'From JSON notes',
      };

      final history = History.fromJson(json);

      expect(history.id, 'test-id-789');
      expect(history.diseaseName, testDiseaseName);
      expect(history.dateLogged, testDate);
      expect(history.notes, 'From JSON notes');
    });

    test('fromJson should handle missing optional fields', () {
      final json = {
        'id': 'test-id-000',
        'diseaseName': testDiseaseName,
        'dateLogged': testDate.toIso8601String(),
      };

      final history = History.fromJson(json);

      expect(history.notes, isNull);
    });

    test('toJson and fromJson should be reversible', () {
      final json = testHistory.toJson();
      final reconstructed = History.fromJson(json);

      expect(reconstructed.id, testHistory.id);
      expect(reconstructed.diseaseName, testHistory.diseaseName);
      expect(reconstructed.dateLogged, testHistory.dateLogged);
      expect(reconstructed.notes, testHistory.notes);
    });
  });
}