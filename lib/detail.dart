import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'db.dart';

Widget buildDetailCard(MovieDB? movie, String link, int index) {
  return Card(
    child: Column(
      children: [
        Image.network(link + movie!.list[index]['backdrop_path']),
        Text(
          movie.list[index]['original_title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

class DetailMovie extends StatelessWidget {
  DetailMovie({Key? key}) : super(key: key);
  final MovieDB movie = GetIt.I.get<MovieDB>();
  final String link = 'https://image.tmdb.org/t/p/original';
  @override
  Widget build(BuildContext context) {
    final i = ModalRoute.of(context)!.settings.arguments as int;

    return Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(link + movie.list[i]['backdrop_path']),
                Container(
                  color: Colors.amber,
                  child: Text(movie.list[i]['original_title']),
                ),
                Text(
                  movie.list[i]['original_language'],
                  textAlign: TextAlign.center,
                ),
                Text(
                  movie.list[i]['overview'],
                  textAlign: TextAlign.center,
                ),
                Text(
                  movie.list[i]['release_date'],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
