import 'package:newmoviedb/db.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final BehaviorSubject<MovieDB> counter =
      BehaviorSubject<MovieDB>.seeded(MovieDB(Map()));
  Sink<MovieDB> get counterSink => counter.sink;
  Stream<MovieDB> get counterStream => counter.stream;

  MovieDB get value => counter.value;
}
