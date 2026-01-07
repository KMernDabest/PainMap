import 'package:flutter/material.dart';
import 'package:painmap/models/history.dart';
import 'package:painmap/models/body_part.dart';

class HistoryCard extends StatelessWidget {
  final History history;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const HistoryCard({
    super.key,
    required this.history,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final level = _getLevelFromPainLevel(history.level ?? 0);
    final levelColor = _getLevelColor(level);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Severity Badge
              _buildLevelBadge(level, levelColor),
              const SizedBox(width: 16),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Symptom Name (Primary)
                    Text(
                      history.symptomName.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    
                    // Body Part & Disease (Secondary)
                    Row(
                      children: [
                        Icon(
                          _getBodyPartIcon(history.bodyPart),
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            history.bodyPart.name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            shape: BoxShape.circle,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            history.disease.name,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    
                    // Pain Level Indicator
                    if (history.level != null) ...[
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: levelColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.speed,
                                  size: 12,
                                  color: levelColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${history.level}/10',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: levelColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Date & Time (Tertiary)
                          Icon(
                            Icons.access_time,
                            size: 13,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _getTimeAgo(history.dateLogged),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ],
                ),
              ),
              
              // Delete Button
              if (onDelete != null)
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.red[400],
                    size: 22,
                  ),
                  onPressed: onDelete,
                  padding: const EdgeInsets.all(4),
                  constraints: const BoxConstraints(),
                  tooltip: 'Delete',
                )
              else
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

  Widget _buildLevelBadge(Level level, Color levelColor) {
    IconData icon;
    
    switch (level) {
      case Level.severe:
        icon = Icons.warning_rounded;
        break;
      case Level.moderate:
        icon = Icons.info;
        break;
      case Level.mild:
        icon = Icons.error_outline;
        break;
      case Level.low:
        icon = Icons.check_circle;
        break;
      case Level.none:
        icon = Icons.remove_circle_outline;
        break;
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: levelColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: levelColor,
          size: 24,
        ),
      ),
    );
  }

  IconData _getBodyPartIcon(BodyPart bodyPart) {
    switch (bodyPart) {
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

  Level _getLevelFromPainLevel(int painLevel) {
    if (painLevel == 0) return Level.none;
    if (painLevel <= 2) return Level.low;
    if (painLevel <= 4) return Level.mild;
    if (painLevel <= 7) return Level.moderate;
    return Level.severe;
  }

  Color _getLevelColor(Level level) {
    switch (level) {
      case Level.severe:
        return const Color(0xFFEF4444);
      case Level.moderate:
        return const Color(0xFFF59E0B);
      case Level.mild:
        return const Color(0xFFFBBF24);
      case Level.low:
        return const Color(0xFF10B981);
      case Level.none:
        return const Color(0xFF94A3B8);
    }
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
