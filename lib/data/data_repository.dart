import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:painmap/models/history.dart';

class DataRepository {
  final Map<String, History> _histories = {};
  static const String _storageKey = 'histories_data';
  Future<void>? _initFuture;

  DataRepository() {
    _initFuture = _initAndLoadData();
  }

  Future<void> ensureInitialized() async {
    await _initFuture;
  }

  Future<void> _initAndLoadData() async {
    try {
      await _loadData();
    } catch (e) {
      print('Error initializing data: $e');
    }
  }

  Future<void> _loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_storageKey);

      if (jsonString != null && jsonString.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(jsonString);
        _histories.clear();
        for (var json in decoded) {
          final history = History.fromJson(json as Map<String, dynamic>);
          _histories[history.id] = history;
        }
        print('Loaded ${_histories.length} histories from storage');
      }
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  Future<void> addHistory(History history) async {
    _histories[history.id] = history;
    await _saveToStorage();
  }

  Future<void> _saveToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Convert histories to JSON
      final jsonList = _histories.values.map((h) => h.toJson()).toList();

      // Sort by dateLogged descending (newest first)
      jsonList.sort(
        (a, b) => DateTime.parse(
          b['dateLogged'],
        ).compareTo(DateTime.parse(a['dateLogged'])),
      );

      final jsonString = jsonEncode(jsonList);
      await prefs.setString(_storageKey, jsonString);
      print('Saved ${_histories.length} histories to storage');
    } catch (e) {
      print('Error saving data: $e');
    }
  }

  List<History> getAllHistories() {
    final histories = _histories.values.toList();
    // Sort by dateLogged descending (newest first)
    histories.sort((a, b) => b.dateLogged.compareTo(a.dateLogged));
    return histories;
  }

  History? getHistoryById(String id) {
    return _histories[id];
  }
}
