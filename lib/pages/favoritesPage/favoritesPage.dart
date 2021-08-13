import 'package:flutter/material.dart';
import 'package:tmdb_test/generated/l10n.dart';
import 'package:tmdb_test/models/parseMovieModel.dart';

class FavoritesPage extends StatefulWidget {
  final List<ParseMovieModel> favoriteMovies;

  const FavoritesPage({Key? key, required this.favoriteMovies})
      : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favoriteMoviesPageTitle),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.favoriteMovies[index].title!),
            leading: Image.network(
                "https://image.tmdb.org/t/p/w220_and_h330_face/${widget.favoriteMovies[index].posterPath!}"),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${widget.favoriteMovies[index].originalTitle} - ${widget.favoriteMovies[index].releaseDate}"),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                    ),
                    Text("- ${widget.favoriteMovies[index].voteAverage!}"),
                  ],
                ),
              ],
            ),
            isThreeLine: true,
            horizontalTitleGap: 5,
          );
        },
        itemCount: widget.favoriteMovies.length,
      ),
    );
  }
}
