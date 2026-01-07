import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/models/history.dart';
import 'package:painmap/models/symptom.dart';
import 'package:painmap/models/disease.dart';
import 'package:painmap/models/body_part.dart';

void main() {
  group('History Model Tests', () {
    late History testHistory;
    late DateTime testDate;

    setUp(() {
      testDate = DateTime(2026, 1, 7, 10, 30);
      testHistory = History(
        id: 'test-id-123',
        symptomName: Symptom.symptomList.first,
        disease: Disease.diseaseList.first,
        bodyPart: BodyPart.head,
        dateLogged: testDate,
        level: 5,
        notes: 'Test notes',
      );
    });

    test('History should be created with all fields', () {
      expect(testHistory.id, 'test-id-123');
      expect(testHistory.symptomName, Symptom.symptomList.first);
      expect(testHistory.disease, Disease.diseaseList.first);
      expect(testHistory.bodyPart, BodyPart.head);
      expect(testHistory.dateLogged, testDate);
      expect(testHistory.level, 5);
      expect(testHistory.notes, 'Test notes');
    });

    test('History should handle optional fields as null', () {
      final historyNoOptionals = History(
        id: 'test-id-456',
        symptomName: Symptom.symptomList.first,
        disease: Disease.diseaseList.first,
        bodyPart: BodyPart.head,
        dateLogged: testDate,
      );

      expect(historyNoOptionals.level, isNull);
      expect(historyNoOptionals.notes, isNull);
    });

    test('toJson should convert History to Map correctly', () {
      final json = testHistory.toJson();

      expect(json['id'], 'test-id-123');
      expect(json['symptomId'], Symptom.symptomList.first.id);
      expect(json['diseaseId'], Disease.diseaseList.first.id);
      expect(json['bodyPartId'], BodyPart.head.id);
      expect(json['dateLogged'], testDate.toIso8601String());
      expect(json['level'], 5);
      expect(json['notes'], 'Test notes');
    });

    test('fromJson should create History from Map correctly', () {
      final json = {
        'id': 'test-id-789',
        'symptomId': Symptom.symptomList.first.id,
        'diseaseId': Disease.diseaseList.first.id,
        'bodyPartId': BodyPart.head.id,
        'dateLogged': testDate.toIso8601String(),
        'level': 7,
        'notes': 'From JSON notes',
      };

      final history = History.fromJson(json);

      expect(history.id, 'test-id-789');
      expect(history.symptomName.id, Symptom.symptomList.first.id);
      expect(history.disease.id, Disease.diseaseList.first.id);
      expect(history.bodyPart, BodyPart.head);
      expect(history.dateLogged, testDate);
      expect(history.level, 7);
      expect(history.notes, 'From JSON notes');
    });

    test('fromJson should handle missing optional fields', () {
      final json = {
        'id': 'test-id-000',
        'symptomId': Symptom.symptomList.first.id,
        'diseaseId': Disease.diseaseList.first.id,
        'bodyPartId': BodyPart.head.id,
        'dateLogged': testDate.toIso8601String(),
      };

      final history = History.fromJson(json);

      expect(history.level, isNull);
      expect(history.notes, isNull);
    });

    test('toJson and fromJson should be reversible', () {
      final json = testHistory.toJson();
      final reconstructed = History.fromJson(json);

      expect(reconstructed.id, testHistory.id);
      expect(reconstructed.symptomName.id, testHistory.symptomName.id);
      expect(reconstructed.disease.id, testHistory.disease.id);
      expect(reconstructed.bodyPart, testHistory.bodyPart);
      expect(reconstructed.dateLogged, testHistory.dateLogged);
      expect(reconstructed.level, testHistory.level);
      expect(reconstructed.notes, testHistory.notes);
    });
  });
}
