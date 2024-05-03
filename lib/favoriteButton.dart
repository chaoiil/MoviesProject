class Film {
  bool isFavorite;

  Film({
    required this.isFavorite,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      isFavorite: false,
    );
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}