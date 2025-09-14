class Movie {
  final String title;
  final String backDropPath;
  final String overview;
  final int id;
  final String posterPath;
  final String releaseDate;
  final List<int> genreIds; // List of genre IDs
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.id,
    required this.posterPath,
    required this.releaseDate,
    required this.genreIds,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      backDropPath: map['backdrop_path'],
      overview: map['overview'],
      id: map['id'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'], // Assign the release date from the map
      genreIds: List<int>.from(map['genre_ids'].map((x) => x)),
      voteAverage: map['vote_average'].toDouble(),
      voteCount: map['vote_count'],
    );
  }

 // final Future<Null> releaseDate;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backDropPath': backDropPath,
      'overview': overview,
      'id': id,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'genreIds': genreIds,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };

  }


}