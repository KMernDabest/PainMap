import 'package:flutter/material.dart';
import 'package:painmap/models/history.dart';

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
    final disease = history.getDisease();

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
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Disease Icon
              if (disease != null)
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _getPainLevelColor(disease.painLevel).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.medical_services_outlined,
                      color: _getPainLevelColor(disease.painLevel),
                      size: 24,
                    ),
                  ),
                ),
              const SizedBox(width: 16),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Disease Name (Primary)
                    Text(
                      history.diseaseName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    
                    // Body Part & Pain Level (Secondary)
                    if (disease != null)
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              disease.bodyPart.name.replaceAll('_', ' '),
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: _getPainLevelColor(disease.painLevel).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  size: 12,
                                  color: _getPainLevelColor(disease.painLevel),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${disease.painLevel}/10',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: _getPainLevelColor(disease.painLevel),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 8),
                    
                    // Date & Time
                    Row(
                      children: [
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

  Color _getPainLevelColor(int painLevel) {
    if (painLevel <= 2) return const Color(0xFF10B981);
    if (painLevel <= 4) return const Color(0xFFFBBF24);
    if (painLevel <= 6) return const Color(0xFFF59E0B);
    if (painLevel <= 8) return const Color(0xFFEF4444);
    return const Color(0xFFDC2626);
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
