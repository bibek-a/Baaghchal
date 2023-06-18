import 'package:flutter/material.dart';

class Newgame extends StatelessWidget {
  const Newgame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primarySwatch: Colors.cyan),
        home: Scaffold(
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
                    child: Text("1 Player"),
                    color: Colors.blue[600],
                    highlightColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 85),
                    onPressed: () {
                      Navigator.pushNamed(context, '/oneplayer');
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    child: Text("2 Player"),
                    color: Colors.blue[600],
                    highlightColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 85),
                    onPressed: () {
                      Navigator.pushNamed(context, '/twoplayers');
                    }),
              ),
            ],
          )),
        )));
  }
}
