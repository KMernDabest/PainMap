import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:painmap/models/history.dart';

class DataRepository {
  final Map<String, History> _histories = {};
  static const String _storageKey = 'histories_data';
  static const String _initializedKey = 'histories_initialized';
  static const String _assetPath = 'data/history.json';
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
      final isInitialized = prefs.getBool(_initializedKey) ?? false;
      String? jsonString = prefs.getString(_storageKey);
      
      print('=== Loading Data ===');
      print('Already initialized: $isInitialized');
      print('SharedPreferences contains data: ${jsonString != null && jsonString.isNotEmpty}');
      
      // Only load from asset if never initialized before
      if (!isInitialized) {
        print('First time initialization - loading from asset file...');
        jsonString = await rootBundle.loadString(_assetPath);
        await prefs.setBool(_initializedKey, true);
        print('Marked as initialized');
      } else if (jsonString == null || jsonString.isEmpty) {
        print('Initialized but no data - starting with empty list');
        _histories.clear();
        return;
      } else {
        print('Loading from SharedPreferences...');
      }
      
      if (jsonString != null && jsonString.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(jsonString);
        _histories.clear();
        for (var json in decoded) {
          final history = History.fromJson(json as Map<String, dynamic>);
          _histories[history.id] = history;
        }
        print('Loaded ${_histories.length} histories');
        
        // Save to storage immediately after first load
        if (!isInitialized) {
          await _saveToStorage();
        }
      }
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  Future<void> addHistory(History history) async {
    _histories[history.id] = history;
    await _saveToStorage();
  }

  Future<void> deleteHistory(String id) async {
    final removed = _histories.remove(id);
    print('Deleted history with id: $id, existed: ${removed != null}');
    await _saveToStorage();
    print('Delete operation completed, remaining histories: ${_histories.length}');
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
