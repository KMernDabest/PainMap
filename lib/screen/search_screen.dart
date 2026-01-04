import 'package:flutter/material.dart';
import 'package:painmap/widgets/detail_symptom.dart';
import 'package:painmap/widgets/symptom_list_item.dart';
import '../models/body_part.dart';
import '../models/symptom.dart';
import '../widgets/category_card.dart';

class SearchScreen extends StatefulWidget {
  final String? initialQuery;
  const SearchScreen({super.key, this.initialQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  BodyPart? _selectedPart;
  bool _isLoading = true;

  List<Symptom> _allSymptoms = [];
  List<Symptom> _filteredSymptoms = [];

  @override
  void initState() {
    super.initState();
    _loadSymptoms();
  }

  //Load symptoms from symptom list
  void _loadSymptoms() {
  setState(() {
    _isLoading = true;
  });

  _allSymptoms = Symptom.symptomList;

  if (widget.initialQuery != null && widget.initialQuery!.isNotEmpty) {
    _controller.text = widget.initialQuery!;
    _performSearch(_controller.text, bodyPart: _selectedPart);
  } 
  else {
    _filteredSymptoms = List.from(_allSymptoms);
  }

  setState(() {
    _isLoading = false;
  });
}

  
  void _performSearch(String query, {BodyPart? bodyPart}) {
    final queryString = query.trim().toLowerCase();
    final selectedBodyPart = bodyPart ?? _selectedPart;

    setState(() {
      _filteredSymptoms = _allSymptoms.where((symptom) {
        // Match symptom name with search text
        final matchesText = queryString.isEmpty || symptom.name.toLowerCase().contains(queryString);
        
        // Match selected body part category
        final matchesBodyPart = selectedBodyPart == null || symptom.bodyPart == selectedBodyPart;

        return matchesText && matchesBodyPart;
      }).toList();
    });
  }

void _onCategoryTap(BodyPart bodyPart) {
  setState(() {
    _selectedPart = bodyPart;
    _controller.clear(); // Clear search text when selecting category
  });

  // Show ALL symptoms of the selected category
  _performSearch('', bodyPart: bodyPart);
}

//   void _onCategoryTap(BodyPart bodyPart) {
//     setState(() {
//       _selectedPart = bodyPart;
//       _controller.text = bodyPart.name;
//     });

//     _performSearch(bodyPart.name, bodyPart: _selectedPart);

//  }

  void _clearFilters() {
    setState(() {
      _selectedPart = null;
      _controller.clear();
      _filteredSymptoms = List.from(_allSymptoms);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      appBar: AppBar(
        title: const Text('Search Symptoms'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Search Bar
            TextField(
              controller: _controller,
              onChanged: _performSearch,
              decoration: InputDecoration(
                hintText: 'Search symptoms...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearFilters,
                      )
                    : null,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Categories
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: BodyPart.values.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  final part = BodyPart.values[index];
                  final isSelected = _selectedPart == part;
                  return CategoryCard(
                    part: part,
                    isSelected: isSelected,
                    onTap: () => _onCategoryTap(part),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            //Recommendations List
            const Text(
              'Recommadations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredSymptoms.isEmpty
                      ? const Center(child: Text('No symptoms found'))
                      : ListView.builder(
                          itemCount: _filteredSymptoms.length,
                          itemBuilder: (context, index) {
                            final symptom = _filteredSymptoms[index];

                            // return Card(
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(12),
                            //   ),
                            //   child: ListTile(
                            //     title: Text(symptom.name),
                            //     subtitle: Text(symptom.bodyPart.name),
                            //     trailing: const Icon(Icons.chevron_right),
                            //     onTap: () {
                            //       // TODO: Navigate to symptom detail
                            //     },
                            //   ),
                            // );
                            return SymptomListItem(symptom: symptom, onTap: () {
                              // TODO: Navigate to symptom detail
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailSymptom(),
                                ),
                              );
                            });
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
