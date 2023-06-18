// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_import, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, must_be_immutable
import 'package:bagchaal_app/gameboard/gameboard.dart';
import 'package:bagchaal_app/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
import 'About/about.dart';
import 'help/help.dart';
import 'Newgame/newgame.dart';
import 'home/home.dart';
import 'Newgame/1Player/one_player.dart';
import 'Newgame/2Players/two_players.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var title;
  MyApp({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      title: 'Bagchaal-app',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MySplashScreen(),
        '/about': (context) => const About(),
        '/help': (context) => const Help(),
        '/newgame': (context) => const Newgame(),
        '/twoplayers': (context) => const Twoplayers(),
        '/oneplayer': (context) => const Oneplayer(),
        '/gameboard': (context) => Gameboard(),
      },
    );
  }
}
