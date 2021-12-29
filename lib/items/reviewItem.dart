import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_reviews/models/Review.dart';

Container reviewItem(Review review, context) {
  return Container(
    height: MediaQuery.of(context).size.height/6,
    width: MediaQuery.of(context).size.width/4,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.transparent, width: 2)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text("user",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black)
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(review.body??" ",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(review.date??" ",
            textAlign: TextAlign.end,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: Colors.black54),
          ),
        ),
        SizedBox.fromSize(),
      ],
    ),
    );
}