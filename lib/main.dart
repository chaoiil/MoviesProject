import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mooviesproject/film.dart';
import 'package:mooviesproject/film_list.dart';
import 'package:favorite_button/favorite_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Page d\'accueil Flutter Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD50000),
        title: Text("LES FILMS POUR ADULTES"),
      ),
      body: Center(
        child: FutureBuilder<List<Film>>(
          future: addTitle("fr"),
          builder: (context, _snapshot) {
            if (_snapshot.hasError) print(_snapshot.error);
            if (_snapshot.hasData) {
              List<Film> films = _snapshot.data!;
              return FilmList(items: films);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<List<Film>> addTitle(String language) async {
    await Future.delayed(const Duration(seconds: 10));
    var url = Uri.https('api.themoviedb.org', '/3/movie/now_playing', {
      'api_key': 'd05dd3724e636dc8ca314664f17e1227',
      'language': language,
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['results'];
      List<Film> films = data.map((json) => Film.fromJson(json)).toList();
      return films;
    } else {
      throw Exception('Échec');
    }
  }

}
