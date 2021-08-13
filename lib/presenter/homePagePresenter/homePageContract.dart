import 'package:flutter/material.dart';
import 'package:tmdb_test/models/parseMovieModel.dart';
import 'package:tmdb_test/models/succintMovieModel.dart';

abstract class HomePageContract {
  void navigateToDetails(BuildContext context, SuccintMovieModel movieModel,
      ParseMovieModel parseMovieModel, bool isFavorite);
  void navigateToLogin(BuildContext context);
  void navigateToFavoriteList(
      BuildContext context, List<ParseMovieModel> movieList);
  Widget onError(BuildContext context, bool empty);
  Widget onLoading(BuildContext context);
}
