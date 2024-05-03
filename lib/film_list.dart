import 'package:flutter/material.dart';
import 'package:mooviesproject/film.dart';
import 'package:mooviesproject/film_item.dart';

class FilmList extends StatelessWidget {
  final List<Film> items;

  FilmList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return FilmItem(item: items[index]);
        }
    );
  }
}
