import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Oneplayer extends StatelessWidget {
  const Oneplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 29, 109, 175),
              Color.fromARGB(255, 11, 114, 15),
            ],
          )),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 186, 191, 188),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 32,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: height / 1.185,
                    width: 620,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage('lib/icons/home1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CupertinoButton(
                            borderRadius: BorderRadius.circular(30),
                            onPressed: () {
                              Navigator.pushNamed(context, '/gameboard');
                            },
                            color: Color.fromARGB(255, 5, 78, 138),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset('lib/icons/goatpiece.png',
                                    height: 40, width: 40),
                                SizedBox(width: 10),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Play as goat",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 250, 250),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CupertinoButton(
                            borderRadius: BorderRadius.circular(30),
                            onPressed: () {
                              Navigator.pushNamed(context, '/gameboard');
                            },
                            color: Color.fromARGB(255, 5, 78, 138),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset('lib/icons/tigerpiece.png',
                                    height: 40, width: 40),
                                SizedBox(width: 10),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: new Text(
                                    "Play as tiger",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 250, 250),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        )));
  }
}
