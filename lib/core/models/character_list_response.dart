import 'dart:convert';

class CharacterListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Character> results;

  CharacterListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory CharacterListResponse.fromJson(String str) =>
      CharacterListResponse.fromMap(json.decode(str));

  factory CharacterListResponse.fromMap(Map<String, dynamic> json) =>
      CharacterListResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Character>.from(
          json["results"].map((x) => Character.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
  };
}

class Character {
  final String name;
  final String url;

  Character({required this.name, required this.url});

  factory Character.fromMap(Map<String, dynamic> json) =>
      Character(name: json["name"], url: json["url"]);

  Map<String, dynamic> toMap() => {"name": name, "url": url};
}
