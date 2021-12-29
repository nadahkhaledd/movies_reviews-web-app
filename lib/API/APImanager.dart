import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_reviews/models/MoviesResponse.dart';
import 'package:movies_reviews/models/ReviewsResponse.dart';

Future<MoviesResponse> getAllMovies() async {
  final uri = Uri.http("kerols843-001-site1.gtempurl.com", "/api/movies/GetAllMovies");
  final response = await http.get(uri);
  print("\n" + response.body);
  if (response.statusCode == 200) {
    return MoviesResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future<ReviewsResponse> getAllReviews() async {
  final uri = Uri.http("kerols843-001-site1.gtempurl.com", "/api/Review/GetAllReviews");
  final response = await http.get(uri);
  print("\n" + response.body);
  if (response.statusCode == 200) {
    return ReviewsResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}




