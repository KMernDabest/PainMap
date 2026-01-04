import 'dart:convert';
import 'dart:io';

import 'package:painmap/models/history.dart';

class DataRepository {
  final Map<String, History> _histories= {};

  final String _historiesFile;

  
  DataRepository({
    String historiesFile = 'assets/data/histories.json',
  }): _historiesFile = historiesFile {
    _loadData();
  }

  void _loadData() {
    try{
      final historyData = _loadFromFile(_historiesFile);
      for (var json in historyData) {
        final history = History.fromJson(json);
        _histories[history.id] = history;
      }
    }catch(e){
      print('Error loading data: $e');
    }
  }

  List<Map<String, dynamic>> _loadFromFile(String fileName) {
    final file = File(fileName);

    if (file.existsSync()) {
      final content = file.readAsStringSync();

      if (content.isNotEmpty) {
        final decoded = jsonDecode(content) as List;
        return decoded.cast<Map<String, dynamic>>();
      }
    }
    return [];
  }
  
}