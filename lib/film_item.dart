import 'package:flutter/material.dart';
import 'film.dart';

class FilmItem extends StatelessWidget {
  const FilmItem({super.key, required this.item});

  final Film item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.network(
              "https://image.tmdb.org/t/p/w500/${item.posterPath}",
              height: 50,
            ),
          Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }


}
