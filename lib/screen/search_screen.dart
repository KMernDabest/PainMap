import 'package:flutter/material.dart';
import 'package:painmap/models/disease.dart';
import 'package:painmap/repo/disease_list.dart';
import 'package:painmap/widgets/detail_disease.dart';
import 'package:painmap/widgets/disease_list_item.dart';
import 'package:painmap/widgets/bottom_navigation.dart';
import '../models/body_part.dart';
import '../widgets/category_card.dart';

class SearchScreen extends StatefulWidget {
  final BodyPart? initialQuery;
  const SearchScreen({super.key, this.initialQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final int _currentIndex = 1;

  BodyPart? _selectedPart;
  bool _isLoading = true;

  List<Disease> _allDisease = [];
  List<Disease> _filteredDisease = [];

  @override
  void initState() {
    super.initState();
    _loadDiseases();
  }

  //Load diseases from disease list
  void _loadDiseases() {
    setState(() {
      _isLoading = true;
    });

    _allDisease = DiseaseRepository.getAllDiseases();

    if (widget.initialQuery != null) {
       _selectedPart = widget.initialQuery;
      _performSearch('', bodyPart: _selectedPart);
    } else {
      _filteredDisease = List.from(_allDisease);
    }

    setState(() {
      _isLoading = false;
    });
  }

  //Search diseases
  void _performSearch(String query, {BodyPart? bodyPart}) {
    final queryString = query.trim().toLowerCase();
    final selectedBodyPart = bodyPart ?? _selectedPart;

    setState(() {
      _filteredDisease = _allDisease.where((disease) {
        final matchesText =
            queryString.isEmpty ||
            disease.name.toLowerCase().contains(queryString);

        final matchesBodyPart =
            selectedBodyPart == null ||
            disease.bodyPart == selectedBodyPart;

        return matchesText && matchesBodyPart;
      }).toList();
    });
  }

  //Category tap
  void _onCategoryTap(BodyPart bodyPart) {
    setState(() {
      _selectedPart = bodyPart;
      _controller.clear();
    });

    _performSearch('', bodyPart: bodyPart);
  }

  //Clear filters
  void _clearFilters() {
    setState(() {
      _selectedPart = null;
      _controller.clear();
      _filteredDisease = List.from(_allDisease);
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
      appBar: AppBar(title: const Text('Search diseases'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _controller,
              onChanged: _performSearch,
              decoration: InputDecoration(
                hintText: 'Search diseases...',
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
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: BodyPart.values.length,
                separatorBuilder: (_, _) => const SizedBox(width: 14),
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
                  : _filteredDisease.isEmpty
                  ? const Center(child: Text('No diseases found'))
                  : ListView.builder(
                      itemCount: _filteredDisease.length,
                      itemBuilder: (context, index) {
                        final disease = _filteredDisease[index];
                        return DiseaseListItem(
                          disease: disease,
                          onTap: () async {
                            final BodyPart? selectedPart = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailDisease(disease: disease),
                              ),
                            );

                            if (selectedPart != null) {
                              _onCategoryTap(selectedPart);
                            }
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(currentIndex: _currentIndex),
    );
  }
}
