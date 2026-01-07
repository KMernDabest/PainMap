import 'package:flutter/material.dart';
import '../models/body_part.dart';

class CategoryCard extends StatelessWidget {
  final BodyPart part;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.part, required this.isSelected, this.onTap});

static IconData _iconForPart(BodyPart part) {
  switch (part.icon) {
    case 'face':
      return Icons.face;
    case 'handyman':
      return Icons.handyman;
    case 'center_focus':
      return Icons.center_focus_strong;
    case 'directions_walk':
      return Icons.directions_walk;
    case 'accessibility_new':
      return Icons.accessibility_new;
    default:
      return Icons.help_outline;
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