import 'dart:convert';
//https://api.themoviedb.org/3/trending/movie/week?api_key=9461290fb26b12b4340931dae2ce58e9
import 'package:http/http.dart' as http;

class MovieDB {
  List<dynamic> list = [];

  MovieDB(Map<String, dynamic> json) {
    list = json['results'] as List<dynamic>;
  }
}

Future<MovieDB> fetchMovieDB() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/trending/movie/week?api_key=9461290fb26b12b4340931dae2ce58e9'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MovieDB(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
