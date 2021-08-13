import 'package:flutter/material.dart';
import 'package:tmdb_test/models/parseMovieModel.dart';
import 'package:tmdb_test/models/succintMovieModel.dart';
import 'package:tmdb_test/service/parseService.dart';

class SuccintMovieCard extends StatelessWidget {
  final SuccintMovieModel? movieModel;
  final ParseMovieModel? parseMovie;
  final Function? onTap;
  final bool showFavoriteOption;

  const SuccintMovieCard(
      {Key? key,
      this.movieModel,
      this.parseMovie,
      this.showFavoriteOption = true,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        color: Colors.white70,
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
                "https://image.tmdb.org/t/p/w220_and_h330_face/${movieModel?.posterPath ?? parseMovie!.posterPath}"),
            fit: BoxFit.fill),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: showFavoriteOption == true
            ? GestureDetector(
                onTap: () => onTap != null ? onTap!() : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: Icon(
                      movieModel!.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.green.shade600,
                    ),
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
