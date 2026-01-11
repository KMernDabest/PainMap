import 'package:flutter/material.dart';
import 'package:painmap/models/disease.dart';
import 'package:painmap/models/body_part.dart';

class DiseaseListItem extends StatelessWidget {
  final Disease disease;
  final VoidCallback onTap;

  const DiseaseListItem({
    super.key,
    required this.disease,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon based on body part
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    _getBodyPartIcon(),
                    color: const Color(0xFF2563EB),
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              
              // Symptom info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      disease.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          disease.bodyPart.name,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Arrow
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getBodyPartIcon() {
    switch (disease.bodyPart) {
      case BodyPart.head:
        return Icons.face;
      case BodyPart.leftArm:
      case BodyPart.rightArm:
        return Icons.handyman;
      case BodyPart.abdomen:
        return Icons.center_focus_strong;
      case BodyPart.leftLeg:
      case BodyPart.rightLeg:
        return Icons.directions_walk;
      case BodyPart.back:
        return Icons.accessibility_new;
    }
  }
}
