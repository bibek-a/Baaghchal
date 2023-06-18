import 'package:bagchaal_app/Models/FeedbackModel.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

class FeedbackSection extends StatefulWidget {
  const FeedbackSection({Key? key}) : super(key: key);

  @override
  State<FeedbackSection> createState() => _FeedbackSectionState();
}

class _FeedbackSectionState extends State<FeedbackSection> {
  String? feedback;
  String? emoji = "OK";
  String issue = "";
  List<bool> isChecked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> issues = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 29, 109, 175),
              Color.fromARGB(255, 11, 114, 15),
            ],
          )),
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new),
                        iconSize: 30,
                      ),
                    ],
                  ),
                  Text(
                    "Feedback Section",
                    style: TextStyle(
                      color: Color.fromARGB(255, 218, 227, 233),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Calibri",
                      fontSize: 30,
                    ),
                    // SizedBox(height: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onChanged: (val) async {
                        feedback = val;
                        setState(() {});
                      },
                      // maxLength: ,
                      maxLines: 10,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "So what you think about this app",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 11, 11, 11),
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 110, 167, 213),
                            )),
                      ),
                    ),
                  ),
                  // SizedBox(height: 10),
                  Text(
                    "How was your experience with us?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 1, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  EmojiFeedback(
                    onChanged: (index) {
                      print("You have changed the emoji style");
                      emoji = index.toString();
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 30),
                  CupertinoButton(
                    child: Text(
                      "Send Feedback",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    color: Color.fromARGB(255, 13, 84, 143),
                    onPressed: () async {
                      FeedBack newFeedback = FeedBack(
                        message: feedback,
                        emoji: emoji,
                      );

                      // if (feedback != null) {
                      //   await FirebaseFirestore.instance
                      //       .collection("users")
                      //       .doc(widget.userModel.uid)
                      //       .collection("feedbacks")
                      //       .doc(uuid.v1())
                      //       .set(newFeedback.toMap())
                      //       .then((value) =>
                      //           print("Successfully saved the feedback"));
                      //   UIHelper.showAlertDialog(context, "Success",
                      //       "Thank you for your valuable feedback");
                      // } else {
                      //   UIHelper.showAlertDialog(context, "Error",
                      //       "Please write your feedback inside box");
                      // }
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ],
          )),
    );
  }
}
