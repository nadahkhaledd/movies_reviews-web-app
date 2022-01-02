import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_reviews/models/MoviesResponse.dart';
import 'package:movies_reviews/models/Review.dart';
import 'package:movies_reviews/models/ReviewsResponse.dart';

Future<MoviesResponse> getAllMovies() async {
  final uri = Uri.http("localhost:63575", "/api/movies/GetAllMovies");
  final response = await http.get(uri);
  print("\n" + response.body);
  if (response.statusCode == 200) {
    return MoviesResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future<ReviewsResponse> getAllReviews() async {
  final uri = Uri.http("localhost:63575", "/api/Review/GetAllReviews");
  final response = await http.get(uri);
  print("\n" + response.body);
  if (response.statusCode == 200) {
    return ReviewsResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future<Review> updateReview(Review review) async {
  final uri = Uri.http("localhost:63575", "/api/Review/put");
  final response = await http.put(uri, body: jsonEncode(review), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'});

  if(response.statusCode == 200)
  {
    return Review.fromJsonMap(jsonDecode(response.body));
  }
  else
  {
    throw Exception(response.body);
  }
}

Future<Review> addReview(Review review) async
{
  final uri = Uri.http("localhost:63575", "/api/Review/post");
  final response = await http.post(uri, body: jsonEncode(review), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'});

  if(response.statusCode == 200)
  {
    return Review.fromJsonMap(jsonDecode(response.body));
  }
  else {
    throw Exception(response.body);
  }
}

Future<Review> deleteReview(int id) async{
  final uri = Uri.http("localhost:63575", "/api/Review/delete", {"id": id.toString()});
  final response = await http.delete(uri, headers: <String, String>{
  'Content-Type': 'application/json; charset=UTF-8'});

  if(response.statusCode == 200)
    {
      print("success delete");
      return Review.fromJsonMap(jsonDecode(response.body));
    }
  else
    {
      print("failedd");
      throw Exception(response.body);
    }
}
