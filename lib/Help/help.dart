import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_fonts/google_fonts.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initBannerAd();
  }

  _initBannerAd() {
    //
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: BannerAd.testAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {},
      ),
      request: AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.orange,
        title: const Text(
          "Help",
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Text(
                'Introduction on Bagchaal',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Baghchal is a traditional game played between unequal forces with different, goals which makes the game very mentally engaging and interesting. \n\nThe game is played between 2 sides: Goats and Tigers. Tigers try to capture the goats whereas goats try to defend themselves by blocking off the tigers.The gameboard consists of a 5*5 points with lines connecting them. The movement of pieces can be made along these lines",
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  softWrap: true,
                  maxLines: null,
                  style: TextStyle(
                    color: Colors.tealAccent,
                    // fontSize: 16,
                    fontFamily: "Josefin Sans",
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              child: Image.asset("img/gameboard.png"),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                child: Text(
                  "The main objective for goats is to surround all tigers such that they cant make any valid movement.For tigers its simple just capture (eat) all the goats\n\nRules for piece movement Goats are able to moved to any of the nearest point to the point they are at present along the lines. Tigers are able to do the same movement as goats ie they may be moved along any of the lines to the nearest junction. However during captures they are able to jump over goat placed on the junction following a straight line landing on the next junction adjacent to the position occupied by the goat",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.tealAccent,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  child: Text(
                    "The game starts off with 4 tigers sitting at points on corners of the board waiting to pounce on any goats within their vicinity. The side with goats gets 20 goats in hand at the start of the game. Already placed goats cant be moved till all the 20 goats are placed on the board.\n\n In case of repetition of same position occurs the side of tigers is given the victory in order to limit resort for goats of just using repetitive techniques to defend themselves.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.tealAccent,
                    ),
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: _isAdLoaded
          ? Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : SizedBox(),
    );
  }
}
