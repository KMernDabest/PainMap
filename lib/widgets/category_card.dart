import 'package:flutter/material.dart';
import '../models/body_part.dart';

class CategoryCard extends StatelessWidget {
  final BodyPart part;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.part, this.onTap});

  String _labelForPart(int bodyPartId) {
    for (var part in BodyPart.values) {
      if (part.id == bodyPartId) {
        return part.name;
      }
    }
    return 'Unknown';
  }

//   static IconData _iconForPart(BodyPart part) {
//   // We use the string stored in part.icon to decide which IconData to return
//   switch (part.icon) {
//     case 'general':
//       return Icons.accessibility_new;
//     case 'skin':
//       return Icons.texture;
//     case 'head':
//       return Icons.face;
//     case 'chest':
//       return Icons.favorite;
//     case 'leg':
//       return Icons.directions_walk;
//     case 'neck':
//       return Icons.portrait;
//     case 'arms':
//       return Icons.handyman;
//     case 'abdomen':
//       return Icons.center_focus_strong;
//     case 'pelvis':
//       return Icons.wc;
//     case 'back':
//       return Icons.airline_seat_recline_normal;
//     case 'buttocks':
//       return Icons.airline_seat_flat;
//     default:
//       return Icons.help_outline; // Fallback icon
//   }
// }

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
    final label = _labelForPart(part.id);
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