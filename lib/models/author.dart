import 'dart:convert';

class Author {
  final String name;
  final String key;

  Author({
    required this.name,
    required this.key,
  });

  Author copyWith({
    String? name,
    String? key,
  }) {
    return Author(name: name ?? this.name, key: key ?? this.key);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'author_name': name});
    result.addAll({'author_key': key});

    return result;
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
        name: map['docs']['author_name'] ?? '',
        key: map['docs']['author_key'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) => Author.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Author( author_name: $name, author_key: $key)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Author && other.name == name && other.key == key;
  }

  @override
  int get hashCode {
    return name.hashCode ^ key.hashCode;
  }
}
