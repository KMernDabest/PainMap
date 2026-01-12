import 'package:flutter/material.dart';
import '../models/body_part.dart';

class CategoryCard extends StatelessWidget {
  final BodyPart part;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.part, required this.isSelected, this.onTap});

static IconData _iconForPart(BodyPart part) {
  switch (part) {
    case BodyPart.head:
      return Icons.face;
    case BodyPart.rightArm:
    case BodyPart.leftArm:
      return Icons.handyman;
    case BodyPart.abdomen:
      return Icons.center_focus_strong;
    case BodyPart.rightLeg:
    case BodyPart.leftLeg:
      return Icons.directions_walk;
    case BodyPart.back:
      return Icons.accessibility_new;
  }
}

  @override
  Widget build(BuildContext context) {
    final icon = _iconForPart(part);

    return SizedBox(
      width: 110,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.shade50 : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? Border.all(color: Colors.blue, width: 2)
                  : null,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: isSelected
                      ? Colors.blue
                      : const Color(0xFF2563EB),
                ),
                const SizedBox(height: 8),
                Text(
                  part.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}