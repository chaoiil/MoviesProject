import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'film.dart';
import 'filmItem.dart';
import 'filmList.dart';


class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4CAF50),
          title: Text("Les film de juyniior"),
        ),
        body: Center(
          child: FutureBuilder<List<Film>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? FilmList(items: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }

  Future<List<Film>> products() {

}

}