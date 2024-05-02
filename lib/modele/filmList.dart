import 'package:flutter/material.dart';
import 'film.dart';
import 'filmItem.dart';

class FilmList extends StatelessWidget {
  final List<Film> items;

  FilmList({Key key, this.items}) {
    // TODO: implement FilmList
    throw UnimplementedError();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FilmItem(item: items[index]);
      },
    );
  }
}