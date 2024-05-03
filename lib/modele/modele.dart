// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'dart:convert';

import 'package:mooviesproject/film.dart';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
  Dates dates;
  int page;
  List<Film> liste;
  int totalPages;
  int totalResults;

  Movies({
    required this.dates,
    required this.page,
    required this.liste,
    required this.totalPages,
    required this.totalResults,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
    dates: Dates.fromJson(json["dates"]),
    page: json["page"],
    liste: List<Film>.from(json["liste"].map((x) => Film.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "dates": dates.toJson(),
    "page": page,
    "liste": List<dynamic>.from(liste.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Dates {
  DateTime maximum;
  DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );

  Map<String, dynamic> toJson() => {
    "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
    "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  };
}


enum OriginalLanguage {
  EN,
  FR,
  IT,
  KO
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "it": OriginalLanguage.IT,
  "ko": OriginalLanguage.KO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
