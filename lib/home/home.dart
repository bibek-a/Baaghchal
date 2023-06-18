// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_new

import 'package:bagchaal_app/Feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // print(height);
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 2, 74, 4),
        appBar: AppBar(
          // elevation: 05,
          // shadowColor: Colors.amber,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 29, 109, 175),
                Color.fromARGB(255, 11, 114, 15),
              ],
            )),
          ),
          // backgroundColor: Colors.green[500],
          title: Text(
            "Baaghchaal App",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 11, 0, 14),
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
              // height: height / 1.185,
              width: 618,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 29, 109, 175),
                    Color.fromARGB(255, 11, 114, 15),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage('lib/icons/home.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 11, 114, 15),
                              Color.fromARGB(255, 1, 50, 91),
                            ],
                          )),
                      child: CupertinoButton(
                          child: Text(
                            "New Game",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                            ),
                          ),

                          // highlightColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 85),
                          onPressed: () {
                            Navigator.pushNamed(context, '/oneplayer');
                          }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 11, 114, 15),
                              Color.fromARGB(255, 1, 50, 91),
                            ],
                          )),
                      child: CupertinoButton(
                          // borderRadius: BorderRadius.circular(30),
                          child: new Text(
                            "About",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 100),
                          onPressed: () {
                            Navigator.pushNamed(context, '/about');
                          }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 11, 114, 15),
                              Color.fromARGB(255, 1, 50, 91),
                            ],
                          )),
                      child: CupertinoButton(
                          child: Text(
                            "Help",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 100),
                          onPressed: () {
                            Navigator.pushNamed(context, '/help');
                          }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 11, 114, 15),
                              Color.fromARGB(255, 1, 50, 91),
                            ],
                          )),
                      child: CupertinoButton(
                          child: Text(
                            "Feedback",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 100),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FeedbackSection();
                            }));
                          }),
                    ),
                  ),
                ],
              )),
        ));
  }
}
