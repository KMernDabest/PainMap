import 'package:flutter/material.dart';
import '../common/widget/category_card.dart';
import '../models/body_part.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<String> _allItems = [
    'Headache pain',
    'Migraine headache',
    'Chest tightness',
    'Chest pain',
    'Abdominal pain',
    'Stomach ache',
    'Lower back pain',
    'Back spasm',
    'Leg cramp',
    'Knee pain',
    'Skin rash',
    'Itchy skin',
    'Fever',
    'Cough',
    'Nausea',
  ];

  List<String> _filtered = [];

  // Categories to show in the horizontal list
  final List<BodyPart> _categoryParts = [
    BodyPart.general,
    BodyPart.skin,
    BodyPart.head,
    BodyPart.chest,
    BodyPart.abdomen,
    BodyPart.back,
    BodyPart.leg,
    BodyPart.skin,
    BodyPart.neck,
    BodyPart.arms,
  ];

  @override
  void initState() {
    super.initState();
    _filtered = List.from(_allItems);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        _filtered = List.from(_allItems);
      } else {
        _filtered = _allItems.where((s) => s.toLowerCase().contains(q)).toList();
      }
    });
  }

  String _labelForPart(BodyPart bodyPart) {
    switch (bodyPart) {
      case BodyPart.head:
        return 'Headache';
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

  void _onCategoryTap(BodyPart bodyPart) {
    final label = _labelForPart(bodyPart);
    _controller.text = label;
    _performSearch(label);
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _controller,
              onChanged: _performSearch,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Search symptoms...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          _performSearch('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categories Section
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Categories horizontal list
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categoryParts.length,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final part = _categoryParts[index];
                  return CategoryCard(part: part, onTap: () => _onCategoryTap(part));
                },
              ),
            ),
            const SizedBox(height: 20),

            // History Section
            const Text(
              'Last Checked Symptoms',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: _filtered.isEmpty
                  ? const Center(child: Text('No results'))
                  : ListView.builder(
                      itemCount: _filtered.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.search),
                          title: Text(_filtered[index]),
                          subtitle: const Text('Tap for more details'),
                          trailing: const Text('3:32 PM'),
                          onTap: () {
                            // TODO: navigate to symptom detail
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
