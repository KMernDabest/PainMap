import 'package:flutter/material.dart';

class SymptomList extends StatelessWidget {
  final String? symptoms;

  const SymptomList({super.key, this.symptoms});

  @override
  Widget build(BuildContext context) {
    final items = symptoms?.split(',') ?? [];

    return Column(
      children: items.map((symptom) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 5,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.circle,
                size: 6,
                color: Color(0xFF2563EB),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  symptom.trim(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF475569),
                    height: 1,
                    
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
