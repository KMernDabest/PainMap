import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        // backgroundColor: const Color(0xFF2563EB),
      ),
      body: const Center(
        child: Text('Previously tracked symptoms'),
      ),
    );
  }
}
