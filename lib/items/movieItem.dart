import 'package:flutter/material.dart';
import 'package:movies_reviews/models/Movie.dart';
import 'package:movies_reviews/screens/reviewsPage.dart';

InkWell movieItem(Movie movieItem, context)
{
  int d = (movieItem.duration! * 60).toInt();
  return InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => reviewsPage(movieItem)));
    },
    child: Container(

      child: Column(

        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(13.0),
                child: Image.asset("assets/images/movies.jpg",
                    height: MediaQuery.of(context).size.height/8, width: MediaQuery.of(context).size.width/16)
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movieItem.name??" ",
              textAlign: TextAlign.start,
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 17),
            ),
          ),

          Row(
            children: [
              Expanded(
                  child: Text(d.toString() + "min",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 14),
                  ),
              ),

              Expanded(
                child: Text(movieItem.release??" ",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 14),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}