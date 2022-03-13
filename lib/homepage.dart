import 'package:flutter/material.dart';
import 'package:newmoviedb/appbar.dart';

import 'db.dart';
import 'detail.dart';
import 'package:get_it/get_it.dart';
import 'theme.dart';

final theme = MovieDBTheme.light();

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
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: const PreferredSize(
              child: MovieAppBar(), preferredSize: Size.fromHeight(50)),
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
