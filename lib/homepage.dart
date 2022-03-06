import 'package:flutter/material.dart';

import 'db.dart';
import 'detail.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 20;
  MovieDB? movie;
  String link = 'https://image.tmdb.org/t/p/original';
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    MovieDB movietemp = await fetchMovieDB();
    setState(() {
      movie = movietemp;
      GetIt.I.registerSingleton<MovieDB>(movie!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: const Text(
              'MovieDB',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            foregroundColor: Colors.yellow,
          ),
          body: ListView.builder(
              itemCount: i,
              itemBuilder: (BuildContext context, int index) {
                if (movie?.list == null) {
                  return CircularProgressIndicator();
                } else {
                  return GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailMovie(),
                                    settings: RouteSettings(arguments: index)))
                          },
                      child: buildDetailCard(movie, link, index));
                }
              })),
    );
  }
}
