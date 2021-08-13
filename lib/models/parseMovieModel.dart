class ParseMovieModel {
  String? className;
  String? objectId;
  String? createdAt;
  String? updatedAt;
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  String? voteAverage;
  int? voteCount;

  ParseMovieModel(
      {this.className,
      this.objectId,
      this.createdAt,
      this.updatedAt,
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  ParseMovieModel.fromJson(Map<String, dynamic> json) {
    className = json['className'];
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    adult = json['adult'] ?? true;
    backdropPath = json['backdropPath'] ?? "";
    genreIds = json['genreIds'] != null ? json['genreIds'].cast<int>() : [];
    originalLanguage = json['originalLanguage'] ?? "";
    originalTitle = json['originalTitle'] ?? "";
    overview = json['overview'] ?? "";
    popularity = json['popularity'] ?? 0.0;
    posterPath = json['posterPath'] ?? "";
    releaseDate = json['releaseDate'] ?? "";
    title = json['title'] ?? "";
    video = json['video'] ?? false;
    voteAverage = json['voteAverage'].toString();
    voteCount = json['voteCount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['className'] = this.className;
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['adult'] = this.adult;
    data['backdropPath'] = this.backdropPath;
    data['genreIds'] = this.genreIds;
    data['originalLanguage'] = this.originalLanguage;
    data['originalTitle'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['posterPath'] = this.posterPath;
    data['releaseDate'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['voteAverage'] = this.voteAverage;
    data['voteCount'] = this.voteCount;
    return data;
  }
}
