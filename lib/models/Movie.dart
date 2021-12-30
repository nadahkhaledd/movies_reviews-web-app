class Movie
{

  int id;
  String name;
  String release;
  double duration;
  Movie({required this.id, required this.name, required this.release, required this.duration});

  Movie.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        name = map["name"],
        release = map["release"],
        duration = map["duration"];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'release' : release,
    'duration': duration,
  };



}