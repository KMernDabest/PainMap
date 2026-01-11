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
      // Error initializing data
    }
  }

  Future<void> _loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isInitialized = prefs.getBool(_initializedKey) ?? false;
      String? jsonString = prefs.getString(_storageKey);
      
      // Only load from asset if never initialized before
      if (!isInitialized) {
        jsonString = await rootBundle.loadString(_assetPath);
        await prefs.setBool(_initializedKey, true);
      } else if (jsonString == null || jsonString.isEmpty) {
        _histories.clear();
        return;
      }

      if (jsonString.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(jsonString);
        _histories.clear();
        for (var json in decoded) {
          final history = History.fromJson(json as Map<String, dynamic>);
          _histories[history.id] = history;
        }
        
        // Save to storage immediately after first load
        if (!isInitialized) {
          await _saveToStorage();
        }
      }
    } catch (e) {
      // Error loading data
    }
  }

  Future<void> addHistory(History history) async {
    _histories[history.id] = history;
    await _saveToStorage();
  }

  Future<void> deleteHistory(String id) async {
    _histories.remove(id);
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
    } catch (e) {
      // Error saving data
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
