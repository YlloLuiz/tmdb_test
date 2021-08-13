import 'package:flutter/material.dart';
import 'package:tmdb_test/models/parseMovieModel.dart';
import 'package:tmdb_test/models/succintMovieModel.dart';

abstract class HomePresenterContract {
  getNowPlaying(BuildContext context);
  getFavoriteMovies(BuildContext context);
  addFavoriteMovie(BuildContext context, SuccintMovieModel movie);
  removeFavoriteMovie(BuildContext context, SuccintMovieModel? movie);
  Future<bool> logout();
}
