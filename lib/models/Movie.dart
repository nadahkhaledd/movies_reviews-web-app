class Movie
{

  int? id;
  String? name;
  String? release;
  double? duration;

  Movie.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        name = map["name"],
        release = map["release"],
        duration = map["duration"];



}