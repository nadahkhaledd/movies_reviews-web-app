import 'package:flutter/material.dart';
import 'package:movies_reviews/API/APImanager.dart';
import 'package:movies_reviews/items/movieItem.dart';
import 'package:movies_reviews/models/MoviesResponse.dart';
import 'package:movies_reviews/models/Movie.dart';

class homeScreen extends StatefulWidget {

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late Future<MoviesResponse> moviesFuture;
  @override
  void initState() {
    super.initState();
    moviesFuture = getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Movies reviews",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only( left: 20, right: 20),
        child: Container(
          child: FutureBuilder<MoviesResponse>(
            future: moviesFuture,
            builder: (buildContext, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(top: 45, bottom: 15, left: 20, right: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 17,
                        crossAxisSpacing: 15),
                    itemBuilder: (buildContext, index) =>
                        movieItem(snapshot.data!.list[index], context),
                    itemCount: snapshot.data!.list.length,
                  ),
                );
              }
              else if (snapshot.hasError)
                {
                  print(snapshot.error);
                }

              return Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ));
            },
          ),
        ),
      ),
    );
  }
}
