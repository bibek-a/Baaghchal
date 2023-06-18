import 'dart:async';
import 'dart:developer';
import 'package:bagchaal_app/Models/UIHelper.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'dart:convert';
import 'package:flutter/rendering.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Gameboard extends StatefulWidget {
  const Gameboard({Key? key}) : super(key: key);

  @override
  _GameboardState createState() => _GameboardState();
}

//android>app>src>main.
class _GameboardState extends State<Gameboard> {
  bool isPressed = true;
  List gameState = [
    "tiger",
    "empty",
    "empty",
    "empty",
    "tiger",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "tiger",
    "empty",
    "empty",
    "empty",
    "tiger",
  ];

  List newGamestate = [
    ["a", "b", "c", "d", "e"],
    ["f", "g", "h", "i", "j"],
    ["k", "l", "m", "n", "o"],
    ["p", "q", "r", "s", "t"],
    ["u", "v", "w", "x", "y"],
  ];

  conversion(int a) {
    // conversion of 1d into 2d/
    int a = 0;
    for (var i = 0; i <= 4; i++) {
      for (var j = 0; j <= 4; j++) {
        newGamestate[i][j] = gameState[a] as String;
        a++;
      }
    }
    for (var i = 0; i <= 4; i++) {
      for (var j = 0; j <= 4; j++) {
        // newGamestate[i][j] = ;
      }
    }
  }

  List<int> currentIndexIn2D = [0, 0];

  __conversion(int index) {
    bool ___breaked = false;
    int a = 0;
    for (var i = 0; i <= 4; i++) {
      for (var j = 0; j <= 4; j++) {
        currentIndexIn2D = [i, j];
        if (a == index) {
          ___breaked = true;
          break;
        }
        a++;
      }
      if (___breaked == true) break;
      ___breaked = false;
    }
    // print(currentIndexIn2D.toString());
  }

  var Tiger = Image.asset("lib/icons/tigerpiece.png", height: 100, width: 100);
  var Goat = Image.asset("lib/icons/goatpiece.png", height: 100, width: 100);

  bool isTigerPressed = false;
  var OldIndex;
  bool turn = false;
  // AssetsAudioPlayer player1 = AssetsAudioPlayer();
  playGame(int index) async {
    if (gameState[index] == "empty") {
      log("I pressed the empty");
      // player1.open(Audio("music/audio2.wav"));
      if (isTigerPressed) {
        gameState[index] = "tiger";
        gameState[OldIndex] = "empty";
      } else {
        gameState[index] = "goat";
        if (turn) {
          gameState[OldIndex] = "empty";
          turn = false;
        }
      }
      isTigerPressed = false;
    } else if (gameState[index] == "goat") {
      log("I pressed the goat");
      turn = true;
      OldIndex = index;
      isTigerPressed = false;
    } else if (gameState[index] == "tiger") {
      log("I pressed the tiger");
      isTigerPressed = true;
      OldIndex = index;
    }
    __conversion(index);
    final url = "http://10.0.2.2:5000/name";
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: _goats_in_hand > 0
            ? json.encode({
                "board": {
                  "prev": [0, 0], //prev
                  "next": currentIndexIn2D, //next
                }
              })
            : json.encode({
                "board": {
                  "prev": [0, 0], //prev
                  "next": currentIndexIn2D, //next
                }
              }));
    print("post request is granted");
    final __response = await http.get(uri);
    print("Get Request is granted");
    final decoded = await json.decode(__response.body) as Map<String, dynamic>;
    setState(() {
      __next = decoded["board"]["next"].toString();
      _goats_in_hand = decoded["board"]["_goats_in_hand"];
      _goats_killed = decoded["board"]["_goats_killed"];
      turnfor = decoded["board"]["turnfor"].toString();
    });

    log("goat's new position is: " + currentIndexIn2D.toString());
  }

  getIcon(int index) {
    switch (gameState[index]) {
      case ("goat"):
        return Goat;
        break;

      case ("tiger"):
        return Tiger;
        break;
    }
  }

  resetGame() {
    setState(() {});
    // player1.open(Audio("music/audio.wav"));
    gameState = [
      "tiger",
      "empty",
      "empty",
      "empty",
      "tiger",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "tiger",
      "empty",
      "empty",
      "empty",
      "tiger"
    ];
  }

  var __next = "[0,0]";
  var _goats_in_hand = 20;
  var _goats_killed = 0;
  var turnfor = "Goat";
  //
  @override
  void initState() {
    // playGame(0);
    // __changeColor();
    // UIHelper.showAlertDialog(context, "title", "New Game is starting");
  }

  Color _leftSideColor = Color.fromARGB(255, 29, 109, 175);
  Color _rightSideColor = Color.fromARGB(255, 11, 114, 15);

  // //
  // __changeColor() {
  //   int colorCode = 29;
  //   log("The color is animating");
  //   setState(() {
  //     _leftSideColor = Color.fromARGB(255, colorCode, 109, 175);
  //     colorCode += 500;
  //   });
  //   Timer(new Duration(seconds: 6), __changeColor);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // backgroundColor: Color.fromARGB(255, 29, 109, 175),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                _leftSideColor,
                _rightSideColor,
              ],
            )),
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.red,
                                    ],
                                  )),
                              child: Text(
                                "Next coordinate : " + __next.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.red,
                                    ],
                                  )),
                              child: Text(
                                "Goats in hand : " + _goats_in_hand.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.red,
                                    ],
                                  )),
                              child: Text(
                                "Goats killed : " + _goats_killed.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.red,
                                    ],
                                  )),
                              child: Text(
                                "Turn for : " + turnfor,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: MaterialButton(
                                onPressed: () {
                                  resetGame();
                                  // UIHelper.showAlertDialog(context, "Succeed",
                                  //     "The Game is Reset !!");
                                },
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(08),
                                ),
                                child: Text(
                                  "Reset Game",
                                  style: TextStyle(
                                      color: Colors.red,
                                      backgroundColor: Colors.black),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 1.99,
                              width: MediaQuery.of(context).size.height / 1.9,
                              child: Stack(
                                children: [
                                  Container(
                                    height: height,
                                    child: Image.asset(
                                      "img/gameboard2.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.red,
                                    child: Center(
                                      child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5,
                                            mainAxisSpacing: 2,
                                            childAspectRatio: 1,
                                            crossAxisSpacing: 1,
                                          ),
                                          itemCount: 25,
                                          shrinkWrap: true,
                                          itemBuilder: (contect, index) =>
                                              Container(
                                                  color: Colors.green
                                                      .withOpacity(0),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        playGame(index);
                                                      });
                                                    },
                                                    child: Center(
                                                      child: getIcon(index),
                                                    ),
                                                  ))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
          //
        ));
  }
}

// {tiger:[(1,1),(1,2)],
// goat: [(1.2)]}
