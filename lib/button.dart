import 'package:flutter/material.dart';
import 'package:mooviesproject/favoriteButton.dart';

class DetailsFilmScreen extends StatefulWidget {
  final Film film;

  const DetailsFilmScreen({Key? key, required this.film}) : super(key: key);

  @override
  State<DetailsFilmScreen> createState() => _DetailsFilmScreenState();
}

class _DetailsFilmScreenState extends State<DetailsFilmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                widget.film.toggleFavorite();
              },
              child: Text(widget.film.isFavorite ? "hello les girls"),
            ),
          ],
        ),
      ),
    );
  }
}
