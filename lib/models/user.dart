

class User {
  final int id;
  final String username;
  final DateTime birthdate;
  User({
    required this.id,
    required this.username,
    required this.birthdate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'birthdate': birthdate.toIso8601String(),
    };
  }
}