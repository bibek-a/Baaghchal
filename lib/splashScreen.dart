import 'package:bagchaal_app/home/home.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
// import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: SafeArea(
        // child: SplashScreen(
        //   // imageBackground: Colors.green[500],
        //   seconds: 5,
        //   navigateAfterSeconds: new Home(),
        //   title: Text(
        //     "Welcome to Bagchaal App",
        //     style: GoogleFonts.josefinSans(
        //       color: Color.fromARGB(255, 48, 5, 2),
        //       fontSize: width / 015,
        //     ),
        //   ),
        //   image: Image.asset('lib/icons/home.png'),
        //   backgroundColor: Colors.green[500],
        //   styleTextUnderTheLoader: new TextStyle(),
        //   photoSize: width / 2,
        //   loaderColor: Colors.red,
        // ),
        child: EasySplashScreen(
          logo: Image.asset("lib/icons/home.png"),
          title: Text(
            "Welcome to Bagchaal App",
            style: TextStyle(
              fontSize: width / 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.green,
          showLoader: true,
          // loadingText: Text("Loading..."),
          navigator: Home(),
          durationInSeconds: 5,
        ),
      ),
    );
  }
}
