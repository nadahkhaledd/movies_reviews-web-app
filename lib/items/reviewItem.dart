import 'package:flutter/material.dart';
import 'package:movies_reviews/API/APImanager.dart';
import 'package:movies_reviews/models/Review.dart';

class reviewItem extends StatefulWidget
{
  late Review review;
  late List<Review> related;
  reviewItem(this.review, this.related);
  @override
  State<reviewItem> createState() => _reviewItemState();
}

class _reviewItemState extends State<reviewItem> {
  bool inputEnabled = false;
  @override
  Widget build(BuildContext context) {
      return Container(
          //height: MediaQuery.of(context).size.height / 6,
          //width: MediaQuery.of(context).size.width / 4,
          decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black54))),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("user",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: !inputEnabled? Text(
                        widget.review.body ,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black54),
                      ):
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: widget.review.body,
                              validator: (value){
                                if(value == null || value.isEmpty)
                                  return 'please enter a review';
                                return null;
                              },
                              onChanged: (newValue){
                                setState(() {
                                  widget.review.body = newValue;
                                });
                              },
                            ),
                          )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.review.date,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox.fromSize(),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            textStyle: TextStyle(color: Colors.black87),
                          ),
                          onPressed: () {
                            setState(() {
                              if(!inputEnabled)
                                inputEnabled = true;
                              else if(inputEnabled)
                                {
                                  Future<Review> r = updateReview(widget.review);
                                  inputEnabled = false;
                                }
                            });
                          },
                          child: !inputEnabled? Text("Edit"): Text("save")
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            textStyle: TextStyle(color: Colors.black87),
                          ),
                          onPressed: ()
                          {
                            setState(() {
                              Future<Review> r = deleteReview(widget.review.id);
                              widget.related.remove(widget.review);
                            });
                          },
                          child: Text("Delete")
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      );
  }
}
