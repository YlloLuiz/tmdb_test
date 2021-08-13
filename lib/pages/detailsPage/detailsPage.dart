import 'package:flutter/material.dart';
import 'package:tmdb_test/generated/l10n.dart';
import 'package:tmdb_test/models/parseMovieModel.dart';
import 'package:tmdb_test/models/succintMovieModel.dart';
import 'package:tmdb_test/presenter/homePagePresenter/homePresenter.dart';

class DetailsPage extends StatefulWidget {
  final SuccintMovieModel? movieModel;
  final ParseMovieModel? parseMovieModel;
  final HomePresenter presenter;
  bool isFavorite;

  DetailsPage(
      {Key? key,
      this.movieModel,
      this.parseMovieModel,
      required this.isFavorite,
      required this.presenter})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieModel != null
            ? widget.movieModel!.title!
            : widget.parseMovieModel!.title!),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: widget.isFavorite ? Colors.green : Colors.black,
            ),
            onPressed: () {
              if (widget.isFavorite == false) {
                widget.presenter.addFavoriteMovie(context, widget.movieModel!);
              } else {
                widget.presenter
                    .removeFavoriteMovie(context, widget.movieModel!, null);
              }

              setState(() => widget.isFavorite = !widget.isFavorite);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageComponent(
                  posterPath: widget.movieModel?.posterPath! ??
                      widget.parseMovieModel!.posterPath!),
              Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 24, color: Colors.black87),
                    children: [
                      TextSpan(
                          text:
                              "${widget.movieModel?.originalTitle ?? widget.parseMovieModel!.originalTitle!}\n"),
                      TextSpan(
                        text: " ${S.of(context).releaseDate}: "
                            "${widget.movieModel?.releaseDate?.replaceAll("-", "/") ?? widget.parseMovieModel!.releaseDate?.replaceAll("-", "/")}",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 35,
                    ),
                    Text(
                      "- ${widget.movieModel?.voteAverage ?? widget.parseMovieModel!.voteAverage!}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              ExpansionTile(
                title: Text(S.of(context).movieDetails),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                        children: [
                          TextSpan(text: "${S.of(context).overview}: "),
                          TextSpan(
                              text:
                                  "${widget.movieModel?.overview ?? widget.parseMovieModel!.overview}\n"),
                          TextSpan(
                              text:
                                  "${widget.movieModel?.overview ?? widget.parseMovieModel!.overview}\n")
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageComponent extends StatelessWidget {
  final String posterPath;

  const ImageComponent({Key? key, required this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.height * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 5,
              ),
            ],
            image: DecorationImage(
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w220_and_h330_face/$posterPath",
                ),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
