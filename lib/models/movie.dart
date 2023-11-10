class Movie {
  String title;
  String backDropPath;
  String orginalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String mediaType;
  double voteAverge;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.orginalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.mediaType,
    required this.voteAverge,
  });

  factory Movie.fromJson(Map<String, dynamic>json){
    return Movie(
      title: json["title"]??"",
      backDropPath: json["backdrop_path"]??"",
      orginalTitle: json["original_title"]??"",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"]??"",
      releaseDate: json["release_date"]??"No Data Available",
      mediaType: json["media_type"]??"No Data Available",
      voteAverge: json["vote_average"]??"",
    );
  }
}