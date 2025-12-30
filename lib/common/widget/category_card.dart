import 'package:flutter/material.dart';
import '../../models/body_part.dart';

class CategoryCard extends StatelessWidget {
  final BodyPart part;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.part, this.onTap});

  static String _labelForPart(BodyPart body) {
    switch (body) {
      case BodyPart.head:
        return 'Head';
      case BodyPart.neck:
        return 'Neck';
      case BodyPart.chest:
        return 'Chest';
      case BodyPart.arms:
        return 'Arms';
      case BodyPart.abdomen:
        return 'Abdomen';
      case BodyPart.back:
        return 'Back';
      case BodyPart.leg:
        return 'Leg';
      case BodyPart.skin:
        return 'Skin';
      default:
        return 'General';
    }
  }

  static IconData _iconForPart(BodyPart body) {
    switch (body) {
      case BodyPart.head:
        return Icons.headset;
      case BodyPart.neck:
        return Icons.swap_vert; // generic
      case BodyPart.chest:
        return Icons.favorite;
      case BodyPart.arms:
        return Icons.pan_tool;
      case BodyPart.abdomen:
        return Icons.local_hospital;
      case BodyPart.back:
        return Icons.format_align_center;
      case BodyPart.leg:
        return Icons.directions_run;
      case BodyPart.skin:
        return Icons.bubble_chart;
      default:
        return Icons.device_unknown;
    }
  }

  @override
  Widget build(BuildContext context) {
    final label = _labelForPart(part);
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
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 32, color: const Color(0xFF2563EB)),
                const SizedBox(height: 8),
                Text(
                  label,
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