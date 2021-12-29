import 'package:movies_reviews/models/Review.dart';

class ReviewsResponse
{
  List<Review> list = [];

  ReviewsResponse(this.list);

  factory ReviewsResponse.fromJson(Map<String, dynamic> map){
    List<Review> movies = List<Review>.from(map["list"].map((it) => Review.fromJsonMap(it)));
    return ReviewsResponse(movies);
  }

}