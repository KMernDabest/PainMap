

class Disease {
  final int id;
  final String name;
  final String? description;
  final int? level;

  Disease({
    required this.id,
    required this.name,
    this.description,
    this.level,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      level: json['level'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'level': level,
    };
  }

  @override
  String toString() => 'Disease(id: $id, name: $name, description: $description)';

}