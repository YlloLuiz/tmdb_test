import 'dart:convert';

import 'package:tmdb_test/models/succintMovieModel.dart';

import 'package:http/http.dart' as Http;
import 'package:tmdb_test/utils/constants.dart';

class MovieService {
  static Future<List<SuccintMovieModel>> getNowPlayingMovies(
      String page) async {
    List<SuccintMovieModel> nowPlayingMovies = [];

    Http.Response response = await Http.get(
      Uri.parse(Constants.nowPlayingEndPoint +
          "?api_key=${Constants.apiKey}&language=pt-BR&page=$page"),
    );

    if (response.statusCode == 200) {
      String jsonResponse = response.body;

      List<dynamic> responseList = jsonDecode(jsonResponse)['results'];
      responseList.forEach((element) {
        nowPlayingMovies.add(SuccintMovieModel.fromJson(element));
      });
    } else {
      print("Response statusCode ${response.statusCode}");
    }

    print("Movies length -> ${nowPlayingMovies.length}");

    return nowPlayingMovies;
  }
}
