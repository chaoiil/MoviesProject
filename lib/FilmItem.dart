import 'package:flutter/material.dart';
import 'film.dart';

class FruitItem extends StatelessWidget {
  FilmItem({this.item});

  final Film item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  this.page,
                  width: 200,
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.title,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("id:${this.id}"),
                            Text("quantity:${this.item.page}"),
                          ],
                        )))
              ]),
        ));
  }
}