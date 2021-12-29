import 'package:movies_reviews/models/Movie.dart';

class MoviesResponse
{
  List<Movie> list = [];

  MoviesResponse(this.list);

  factory MoviesResponse.fromJson(Map<String, dynamic> map){
    List<Movie> movies = List<Movie>.from(map["list"].map((it) => Movie.fromJsonMap(it)));
    return MoviesResponse(movies);
  }

}