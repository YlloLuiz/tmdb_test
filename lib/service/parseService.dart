import 'dart:convert';

import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:tmdb_test/models/parseMovieModel.dart';
import 'package:tmdb_test/models/succintMovieModel.dart';
import 'package:tmdb_test/utils/info.dart';

class ParseService {
  static late ParseUser currentUser;

  static Future<void> initParse() async {
    await Parse().initialize(appId, serverURL);
  }

  static Future<bool> login(
      String email, String userName, String password) async {
    ParseUser user = ParseUser(userName.trim(), password.trim(), email.trim());

    ParseResponse response = await user.login();

    if (response.success = true && response.result != null) {
      print("login!");

      currentUser = response.result;
      return response.success;
    } else {
      return false;
    }
  }

  static Future<bool> logout() async {
    final ParseResponse? response = await ParseUser.getCurrentUserFromServer(
        currentUser.sessionToken ?? "");

    if (response == null || response.success != true) {
      print("Isso é uma sessão invalida");
    }

    ParseResponse logoutCheck = await currentUser.logout();

    if (logoutCheck.success == true) {
      return logoutCheck.success;
    }

    return false;
  }

  static Future<bool> onRegister(
      String email, String userName, password) async {
    ParseUser user = ParseUser(userName.trim(), password.trim(), email.trim());

    ParseResponse response = await user.create();

    print("Usuário não existente!");

    if (response.result != null && response.success) {
      currentUser = response.result;
      return response.success;
    } else {
      return false;
    }
  }

  static Future<void> addFavoriteMovie(SuccintMovieModel movieModel) async {
    ParseObject movieObject = ParseObject("favoriteMovie")
      ..set("adult", movieModel.adult)
      ..set("backdropPath", movieModel.backdropPath)
      ..set("genreIds", movieModel.genreIds)
      ..set("originalLanguage", movieModel.originalLanguage)
      ..set("originalTitle", movieModel.originalTitle)
      ..set("overview", movieModel.overview)
      ..set("popularity", movieModel.popularity)
      ..set("posterPath", movieModel.posterPath)
      ..set("releaseDate", movieModel.releaseDate)
      ..set("title", movieModel.title)
      ..set("video", movieModel.video)
      ..set("voteAverage", movieModel.voteAverage)
      ..set("voteCount", movieModel.voteCount);

    ParseResponse response = await movieObject.save();

    print(response.statusCode);

    if (response.success == true) {
      print("Filme adicionado!");
    }
  }

  static Future<void> removeFavoriteMovie(SuccintMovieModel movie) async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject("favoriteMovie"));

    parseQuery.whereContains("title", movie.title ?? "");

    ParseResponse response = await parseQuery.query();

    if (response.success || response.result != null) {
      ParseMovieModel model = ParseMovieModel.fromJson(
          json.decode(response.results!.first.toString()));
      ParseResponse deleteResponse =
          await ParseObject("favoriteMovie").delete(id: model.objectId);

      if (deleteResponse.success == true) {
        print("Filme deletado!");
      }
    }
  }
}
