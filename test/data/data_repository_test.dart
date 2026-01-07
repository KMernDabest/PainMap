import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/data/data_repository.dart';
import 'package:painmap/models/history.dart';
import 'package:painmap/models/symptom.dart';
import 'package:painmap/models/disease.dart';
import 'package:painmap/models/body_part.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DataRepository Tests', () {
    late DataRepository repository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      repository = DataRepository();
      await repository.ensureInitialized();
    });

    test('DataRepository should initialize successfully', () async {
      expect(repository, isNotNull);
    });

    test('addHistory should add history to repository', () async {
      final history = History(
        id: 'test-123',
        symptomName: Symptom.symptomList.first,
        disease: Disease.diseaseList.first,
        bodyPart: BodyPart.head,
        dateLogged: DateTime.now(),
        level: 5,
        notes: 'Test',
      );

      await repository.addHistory(history);
      final allHistories = repository.getAllHistories();

      expect(allHistories, contains(history));
      expect(allHistories.any((h) => h.id == 'test-123'), isTrue);
    });

    test('deleteHistory should remove history from repository', () async {
      final history = History(
        id: 'test-456',
        symptomName: Symptom.symptomList.first,
        disease: Disease.diseaseList.first,
        bodyPart: BodyPart.head,
        dateLogged: DateTime.now(),
        level: 3,
      );

      await repository.addHistory(history);
      var allHistories = repository.getAllHistories();
      expect(allHistories.any((h) => h.id == 'test-456'), isTrue);

      await repository.deleteHistory('test-456');
      allHistories = repository.getAllHistories();
      expect(allHistories.any((h) => h.id == 'test-456'), isFalse);
    });

    test('getHistoryById should return correct history', () async {
      final history = History(
        id: 'test-getbyid',
        symptomName: Symptom.symptomList.first,
        disease: Disease.diseaseList.first,
        bodyPart: BodyPart.head,
        dateLogged: DateTime.now(),
        level: 5,
      );

      await repository.addHistory(history);
      final retrieved = repository.getHistoryById('test-getbyid');

      expect(retrieved, isNotNull);
      expect(retrieved?.id, 'test-getbyid');
    });

    test('getHistoryById should return null for non-existent id', () {
      final retrieved = repository.getHistoryById('non-existent');
      expect(retrieved, isNull);
    });
  });
}
