import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tmdb_test/bloc/homeBloc.dart';
import 'package:tmdb_test/components/succintMovieCard.dart';
import 'package:tmdb_test/generated/l10n.dart';
import 'package:tmdb_test/models/parseMovieModel.dart';
import 'package:tmdb_test/models/succintMovieModel.dart';
import 'package:tmdb_test/pages/detailsPage/detailsPage.dart';
import 'package:tmdb_test/pages/favoritesPage/favoritesPage.dart';
import 'package:tmdb_test/pages/loginPage/loginPage.dart';
import 'package:tmdb_test/presenter/homePagePresenter/homePageContract.dart';
import 'package:tmdb_test/presenter/homePagePresenter/homePresenter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageContract {
  late HomePresenter _presenter;

  @override
  void initState() {
    _presenter = HomePresenter();
    _presenter.getNowPlaying(context);
    _presenter.getFavoriteMovies(context);
    super.initState();
  }

  @override
  void navigateToDetails(BuildContext context, SuccintMovieModel? movieModel,
      ParseMovieModel? parseMovieModel, bool isFavorite) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          movieModel: movieModel,
          parseMovieModel: parseMovieModel,
          presenter: _presenter,
          isFavorite: isFavorite,
        ),
      ),
    );
  }

  @override
  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  void navigateToFavoriteList(
      BuildContext context, List<ParseMovieModel> movieList) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritesPage(
          favoriteMovies: movieList,
        ),
      ),
    );
  }

  @override
  Widget onError(BuildContext context, bool empty) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Icon(
                Icons.sentiment_dissatisfied_outlined,
                color: Colors.green.shade600,
                size: MediaQuery.of(context).size.height * 0.12,
              ),
            ),
            Text(
              empty
                  ? S.of(context).homeNoFavoriteMovie
                  : S.of(context).errorText,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget onLoading(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CircularProgressIndicator(),
          ),
          Text(S.of(context).loadingText)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        centerTitle: true,
        elevation: 0,
        leading: Tooltip(
          message: "Logout",
          child: IconButton(
            onPressed: () async {
              await _presenter.logout();

              navigateToLogin(context);
            },
            icon: Icon(Icons.logout),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              /// HeaderLogo
              Padding(
                padding: const EdgeInsets.only(top: 56.0, bottom: 56.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset("assets/appLogo/blue_short.svg"),
                ),
              ),

              /// Now Playing movies list
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: StreamBuilder<List<SuccintMovieModel>>(
                  stream: context.read<HomeBloc>().simpleMovieStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, bottom: 16.0),
                            child: Text(S.of(context).homeTitle_0),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => navigateToDetails(context,
                                      snapshot.data![index], null, false),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: SuccintMovieCard(
                                      movieModel: snapshot.data![index],
                                      onTap: () {
                                        if (snapshot.data![index].isFavorite ==
                                            false) {
                                          _presenter.addFavoriteMovie(
                                              context, snapshot.data![index]);
                                          setState(() =>
                                              snapshot.data![index].isFavorite =
                                                  !snapshot
                                                      .data![index].isFavorite);
                                        } else {
                                          _presenter.removeFavoriteMovie(
                                            context,
                                            snapshot.data![index],
                                          );
                                          setState(() =>
                                              snapshot.data![index].isFavorite =
                                                  !snapshot
                                                      .data![index].isFavorite);
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.length,
                            ),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return onError(context, false);
                    }
                    return onLoading(context);
                  },
                ),
              ),

              /// Favorite Movies List
              StreamBuilder<List<ParseMovieModel>>(
                stream: context.read<HomeBloc>().favoriteMovieStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.length > 0) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(S.of(context).homeTitle_1),
                                TextButton(
                                  child: Text(
                                    S.of(context).homeButton_0,
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                                  onPressed: () => navigateToFavoriteList(
                                      context, snapshot.data!),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => navigateToDetails(context, null,
                                      snapshot.data![index], true),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: SuccintMovieCard(
                                      parseMovie: snapshot.data![index],
                                      showFavoriteOption: false,
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.length,
                            ),
                          )
                        ],
                      );
                    } else {
                      return onError(context, true);
                    }
                  } else if (snapshot.hasError) {
                    return onError(context, false);
                  }
                  return onLoading(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
