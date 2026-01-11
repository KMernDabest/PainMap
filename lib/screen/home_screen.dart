import 'package:flutter/material.dart';
import 'package:painmap/models/body_part.dart';
import 'package:painmap/models/disease.dart';
import 'package:painmap/models/history.dart';
import 'package:painmap/repo/disease_list.dart';
import 'package:painmap/widgets/body_diagram.dart';
import 'package:painmap/widgets/bottom_navigation.dart';
import 'package:painmap/repo/data_repository.dart';
import 'package:uuid/uuid.dart';
import './search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;
  final DataRepository _dataRepository = DataRepository();
  final Uuid _uuid = const Uuid();
  int? _currentPainLevel;

  void _showDiseaseDetailsModal(
    Disease disease,
    BodyPart bodyPart,
    int painLevel,
  ) {
    setState(() {
      _currentPainLevel = painLevel;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(24),
            child: ListView(
              controller: scrollController,
              children: [
                // Header with close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        disease.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Pain level indicator
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: _getPainLevelColor(
                      disease.painLevel,
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _getPainLevelColor(disease.painLevel),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _getPainLevelIcon(disease.painLevel),
                        color: _getPainLevelColor(disease.painLevel),
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pain Level: ${disease.painLevel}/10',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: _getPainLevelColor(disease.painLevel),
                              ),
                            ),
                            Text(
                              _getSeverityText(disease.painLevel),
                              style: TextStyle(
                                fontSize: 14,
                                color: _getPainLevelColor(
                                  disease.painLevel,
                                ).withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Description section
                if (disease.description.isNotEmpty) ...[
                  const Row(
                    children: [
                      Icon(Icons.info_outline, color: Color(0xFF2563EB)),
                      SizedBox(width: 8),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      disease.description,
                      style: const TextStyle(fontSize: 15, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // Emergency warning for high pain levels
                if (disease.painLevel >= 8) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                          size: 32,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'MEDICAL EMERGENCY',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                disease.painLevel >= 10
                                    ? 'Call 911 or go to ER IMMEDIATELY'
                                    : 'Seek emergency medical attention now',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // Action buttons
                ElevatedButton.icon(
                  onPressed: () async {
                    // Create history entry
                    final history = History(
                      id: _uuid.v4(),
                      diseaseName: disease.name,
                      dateLogged: DateTime.now(),
                      level: _currentPainLevel,
                      notes: null,
                    );

                    // Save to repository
                    await _dataRepository.addHistory(history);

                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Saved to history successfully'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.bookmark_add_outlined),
                  label: const Text('Save to History'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _getPainLevelColor(int painLevel) {
    if (painLevel <= 2) return Colors.green;
    if (painLevel <= 4) return Colors.yellow[700]!;
    if (painLevel <= 6) return Colors.orange;
    if (painLevel <= 8) return Colors.deepOrange;
    return Colors.red;
  }

  IconData _getPainLevelIcon(int painLevel) {
    if (painLevel <= 2) return Icons.sentiment_satisfied;
    if (painLevel <= 4) return Icons.sentiment_neutral;
    if (painLevel <= 6) return Icons.sentiment_dissatisfied;
    if (painLevel <= 8) return Icons.sick;
    return Icons.emergency;
  }

  String _getSeverityText(int painLevel) {
    if (painLevel <= 2) return 'Mild';
    if (painLevel <= 4) return 'Moderate';
    if (painLevel <= 6) return 'Severe';
    if (painLevel <= 8) return 'Very Severe';
    return 'Critical Emergency';
  }

  void _showBodyPartModal(BodyPart bodyPart) {
    double painLevel = 1.0;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 32,
                      color: const Color(0xFF2563EB),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      bodyPart.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Pain Level',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      painLevel.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                    const Text(
                      '/ 10',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                Slider(
                  value: painLevel,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  activeColor: const Color(0xFF2563EB),
                  label: painLevel.toInt().toString(),
                  onChanged: (value) {
                    setModalState(() {
                      painLevel = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Match disease based on body part and pain level
                    final disease = DiseaseRepository.findByBodyPartAndPainLevel(
                      bodyPart,
                      painLevel.toInt(),
                    );

                    Navigator.pop(context); // Close the pain level modal

                    if (disease != null) {
                      // Show disease details modal
                      _showDiseaseDetailsModal(
                        disease,
                        bodyPart,
                        painLevel.toInt(),
                      );
                    } else {
                      // Show no match found message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'No disease found for ${bodyPart.name} with pain level ${painLevel.toInt()}',
                          ),
                          backgroundColor: Colors.orange,
                          action: SnackBarAction(
                            label: 'Search',
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      SearchScreen(initialQuery: bodyPart),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Match to Disease',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            SearchScreen(initialQuery: bodyPart),
                            // const _onCategoryTap(bodyPart),
                      ),
                    );
                  },

                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: Color(0xFF2563EB)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Search Symptoms',
                    style: TextStyle(fontSize: 16, color: Color(0xFF2563EB)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: Column(
        children: [
          // 🔵 Top Bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/PainMap-Banner.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Hengneitong Keo',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Color(0xFF2563EB)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    readOnly: true, // 🔒 Prevent keyboard
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SearchScreen()),
                      );
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search diseases...',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.tune),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BodyDiagram(onBodyPartTapped: _showBodyPartModal),
            ),
          ),
        ],
      ),

      bottomNavigationBar: AppBottomNavigation(currentIndex: _currentIndex),
    );
  }
}
