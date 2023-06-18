import 'package:flutter/material.dart';

class Twoplayers extends StatelessWidget {
  const Twoplayers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primarySwatch: Colors.cyan),
        home: Scaffold(
            appBar: AppBar(
              title: Text("2players"),
            ),
            body: Center(
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        child: Text("Play as Tiger"),
                        color: Colors.deepPurple,
                        highlightColor: Colors.purpleAccent,
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 85),
                        onPressed: () {
                          Navigator.pushNamed(context, '/gameboard');
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        child: Text("Play as Goat"),
                        color: Colors.deepPurple,
                        highlightColor: Colors.purpleAccent,
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 90),
                        onPressed: () {
                          Navigator.pushNamed(context, '/gameboard');
                        }),
                  ),
                ],
              )),
            )));
  }
}
