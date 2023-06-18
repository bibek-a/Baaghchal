import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          brightness: Brightness.light,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("About the game..."),
          ),
          body: child(
            Text("Hello there..."),
          ),
        ));
  }

  child(Text text) {}
}
