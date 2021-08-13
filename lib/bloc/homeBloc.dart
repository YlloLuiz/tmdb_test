import 'dart:async';

import 'package:tmdb_test/models/parseMovieModel.dart';
import 'package:tmdb_test/models/succintMovieModel.dart';

class HomeBloc {
  late StreamController<List<SuccintMovieModel>> simpleMovieController;
  late StreamController<List<ParseMovieModel>> favoriteMovieController;

  Stream<List<SuccintMovieModel>> get simpleMovieStream =>
      simpleMovieController.stream;
  Sink<List<SuccintMovieModel>> get simpleMovieSink =>
      simpleMovieController.sink;

  Stream<List<ParseMovieModel>> get favoriteMovieStream =>
      favoriteMovieController.stream;
  Sink<List<ParseMovieModel>> get favoriteMovieSink =>
      favoriteMovieController.sink;

  HomeBloc() {
    simpleMovieController = StreamController.broadcast();
    favoriteMovieController = StreamController.broadcast();
  }

  void setMovieSink(List<SuccintMovieModel> movies) {
    simpleMovieSink.add(movies);
  }

  void updateFavoriteMovieStream(List<ParseMovieModel> movies) {
    favoriteMovieSink.add(movies);
  }

  void dispose() {
    simpleMovieController.close();
    favoriteMovieController.close();
  }
}
