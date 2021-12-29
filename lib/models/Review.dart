import 'dart:convert';

import 'package:movies_reviews/models/Movie.dart';

class Review
{
  int? id;
  String? date;
  String? body;
  int? movieId;
  Movie? movie;

  Review.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        date = map["date"],
        body = map["body"],
        movieId = map["movieId"],
        movie = (map['movie'] != null ? Movie.fromJsonMap(map['movie']) : null)!;
}
