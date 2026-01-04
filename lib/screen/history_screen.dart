import 'package:flutter/material.dart';
import 'package:painmap/widgets/history_card.dart';
import 'package:painmap/models/history.dart';
import 'package:painmap/models/body_part.dart';
import 'package:painmap/models/disease.dart';
import 'package:painmap/models/symptom.dart';
import './home_screen.dart';
import './search_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _currentIndex = 2; // History screen is at index 2
  String _filterLevel = 'All';

  // Mock data - Replace with actual API call or database query
  final List<History> _histories = [
    History(
      id: '1',
      symptomName: Symptom(
        id: 1,
        name: 'Sharp Headache',
        bodyPart: BodyPart.head,
      ),
      disease: Disease(
        painLevel: 1,
        name: 'Migraine',
        bodyPartId: 1,
        description: 'Severe recurring headache',
      ),
      bodyPart: BodyPart.head,
      dateLogged: DateTime.now().subtract(const Duration(hours: 2)),
      level: 8,
      notes: 'Started after long screen time',
    ),
    History(
      id: '2',
      symptomName: Symptom(
        id: 2,
        name: 'Lower Back Pain',
        bodyPart: BodyPart.back,
      ),
      disease: Disease(
        painLevel: 2,
        name: 'Muscle Strain',
        bodyPartId: 7,
        description: 'Muscle overuse injury',
      ),
      bodyPart: BodyPart.back,
      dateLogged: DateTime.now().subtract(const Duration(days: 1)),
      level: 5,
      notes: 'After gym workout',
    ),
    History(
      id: '3',
      symptomName: Symptom(
        id: 3,
        name: 'Mild Knee Discomfort',
        bodyPart: BodyPart.leftLeg,
      ),
      disease: Disease(
        painLevel: 3,
        name: 'Joint Inflammation',
        bodyPartId: 5,
      ),
      bodyPart: BodyPart.leftLeg,
      dateLogged: DateTime.now().subtract(const Duration(days: 2)),
      level: 3,
    ),
  ];

  List<History> get _filteredHistories {
    if (_filterLevel == 'All') return _histories;
    
    return _histories.where((history) {
      final level = _getLevelFromPainLevel(history.level ?? 0);
      return level.name.toLowerCase() == _filterLevel.toLowerCase();
    }).toList();
  }

  Level _getLevelFromPainLevel(int painLevel) {
    if (painLevel == 0) return Level.none;
    if (painLevel <= 2) return Level.low;
    if (painLevel <= 4) return Level.mild;
    if (painLevel <= 7) return Level.moderate;
    return Level.severe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildFilterChips(),
            Expanded(
              child: _filteredHistories.isEmpty
                  ? _buildEmptyState()
                  : _buildHistoriesList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) return;
          
          setState(() {
            _currentIndex = index;
          });

          Widget target;
          switch (index) {
            case 0:
              target = const HomeScreen();
              break;
            case 1:
              target = const SearchScreen();
              break;
            default:
              return;
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => target),
          );
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2563EB),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'Body',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.history,
                  color: Color(0xFF2563EB),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Your symptom timeline',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip('All', Icons.list),
            const SizedBox(width: 8),
            _buildFilterChip('Severe', Icons.warning_rounded),
            const SizedBox(width: 8),
            _buildFilterChip('Moderate', Icons.info_outline),
            const SizedBox(width: 8),
            _buildFilterChip('Mild', Icons.check_circle_outline),
            const SizedBox(width: 8),
            _buildFilterChip('Low', Icons.trending_down),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon) {
    final isSelected = _filterLevel == label;
    Color chipColor;
    
    switch (label) {
      case 'Severe':
        chipColor = const Color(0xFFEF4444);
        break;
      case 'Moderate':
        chipColor = const Color(0xFFF59E0B);
        break;
      case 'Mild':
        chipColor = const Color(0xFFFBBF24);
        break;
      case 'Low':
        chipColor = const Color(0xFF10B981);
        break;
      default:
        chipColor = const Color(0xFF2563EB);
    }

    return FilterChip(
      selected: isSelected,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? Colors.white : chipColor,
          ),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : chipColor,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        fontSize: 13,
      ),
      backgroundColor: Colors.white,
      selectedColor: chipColor,
      checkmarkColor: Colors.white,
      elevation: 0,
      pressElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? chipColor : chipColor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      onSelected: (selected) {
        setState(() {
          _filterLevel = label;
        });
      },
    );
  }

  Widget _buildHistoriesList() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      itemCount: _filteredHistories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: HistoryCard(
            history: _filteredHistories[index],
            onTap: () => _showHistoryDetails(_filteredHistories[index]),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inbox_outlined,
              size: 64,
              color: const Color(0xFF2563EB).withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'No records found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start tracking your symptoms',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  void _showHistoryDetails(History history) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildDetailModal(history),
    );
  }

  Widget _buildDetailModal(History history) {
    final level = _getLevelFromPainLevel(history.level ?? 0);
    final levelColor = _getLevelColor(level);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Symptom name with level badge
          Row(
            children: [
              Expanded(
                child: Text(
                  history.symptomName.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: levelColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: levelColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  level.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: levelColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Details
          _buildDetailRow(
            Icons.person_outline,
            'Body Part',
            history.bodyPart.name.toUpperCase(),
          ),
          _buildDetailRow(
            Icons.medical_services_outlined,
            'Disease',
            history.disease.name,
          ),
          _buildDetailRow(
            Icons.calendar_today,
            'Date',
            _formatDate(history.dateLogged),
          ),
          _buildDetailRow(
            Icons.access_time,
            'Time',
            _formatTime(history.dateLogged),
          ),
          if (history.level != null)
            _buildDetailRow(
              Icons.speed,
              'Pain Level',
              '${history.level}/10',
            ),
          
          // Disease description
          if (history.disease.description != null &&
              history.disease.description!.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text(
              'About the Disease',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                history.disease.description!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF475569),
                  height: 1.5,
                ),
              ),
            ),
          ],
          
          // Notes
          if (history.notes != null && history.notes!.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text(
              'Notes',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF3C7),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFFBBF24).withOpacity(0.3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.notes,
                    size: 18,
                    color: Color(0xFFF59E0B),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      history.notes!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF92400E),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2563EB),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Close',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF64748B)),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
    );
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

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays == 0) return 'Today';
    if (difference.inDays == 1) return 'Yesterday';
    if (difference.inDays < 7) return '${difference.inDays} days ago';
    
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
