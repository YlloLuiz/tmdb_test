import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import 'package:tmdb_test/bloc/homeBloc.dart';
import 'package:tmdb_test/models/parseMovieModel.dart';
import 'package:tmdb_test/models/succintMovieModel.dart';
import 'package:tmdb_test/service/movieService.dart';
import 'package:tmdb_test/service/parseService.dart';

import 'homePresenterContract.dart';

class HomePresenter implements HomePresenterContract {
  @override
  getFavoriteMovies(BuildContext context) async {
    ParseResponse response = await ParseObject("favoriteMovie").getAll();

    if (response.success == true) {
      if (response.results != null) {
        List<ParseMovieModel> movies = [];
        response.results!.forEach((element) {
          movies.add(
            ParseMovieModel.fromJson(
              json.decode(
                element.toString(),
              ),
            ),
          );
        });
        context.read<HomeBloc>().updateFavoriteMovieStream(movies);
      } else {
        print("Não há favoritos )-:");
      }
    }
  }

  @override
  getNowPlaying(BuildContext context) async {
    List<SuccintMovieModel> result =
        await MovieService.getNowPlayingMovies("1");
    context.read<HomeBloc>().setMovieSink(result);
  }

  @override
  Future<bool> logout() async {
    bool success = await ParseService.logout();

    return success;
  }

  @override
  addFavoriteMovie(BuildContext context, SuccintMovieModel movie) async {
    ParseService.addFavoriteMovie(movie);
  }

  @override
  removeFavoriteMovie(BuildContext context, SuccintMovieModel? movie,
      ParseMovieModel? parseMovie) async {
    ParseService.removeFavoriteMovie(movie!);
  }

  void dispose() {}
}
