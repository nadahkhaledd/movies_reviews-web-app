import 'package:movies_reviews/models/Movie.dart';

class Review {
  dynamic id;
  String date;
  String body;
  int movieId;
  Movie movie;

  Review({ required this.id, required this.date, required this.body, required this.movieId, required this.movie}){}

  Review.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        date = map["date"],
        body = map["body"],
        movieId = map["movieId"],
        movie = (map['movie'] != null ? Movie.fromJsonMap(map['movie']) : null)!;

  Map<String, dynamic> toJson() {
    Map<String, dynamic>? movie = this.movie != null ? this.movie.toJson() : null;
    return {
      'id': id,
      'date': date,
      'body': body,
      'movieId': movieId,
      'movie': movie,
    };
  }
}

