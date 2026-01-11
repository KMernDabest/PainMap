import 'package:flutter_test/flutter_test.dart';
import 'package:painmap/models/history.dart';
import 'package:painmap/repo/data_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('DataRepository Tests', () {
    late DataRepository repository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      repository = DataRepository();
      await repository.ensureInitialized();
    });

    test('should add history to repository', () async {
      final history = History(
        id: '1',
        diseaseName: 'Migraine Headache',
        dateLogged: DateTime.now(),
        level: 5,
      );

      await repository.addHistory(history);

      final histories = repository.getAllHistories();
      expect(histories.length, 1);
      expect(histories.first.id, '1');
      expect(histories.first.diseaseName, 'Migraine Headache');
    });

    test('should retrieve all histories', () async {
      final history = History(
        id: '2',
        diseaseName: 'Eye Strain',
        dateLogged: DateTime.now(),
        level: 3,
      );

      await repository.addHistory(history);

      final histories = repository.getAllHistories();
      expect(histories.length, 1);
      expect(histories.first.diseaseName, 'Eye Strain');
    });

    test('should delete history from repository', () async {
      final history = History(
        id: '3',
        diseaseName: 'Tension Headache',
        dateLogged: DateTime.now(),
        level: 7,
      );

      await repository.addHistory(history);
      expect(repository.getAllHistories().length, 1);

      await repository.deleteHistory('3');
      expect(repository.getAllHistories().length, 0);
    });
  });
}
