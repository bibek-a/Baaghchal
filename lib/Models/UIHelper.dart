// import 'package:chating_app/Constants/Style.dart';
// import 'package:chating_app/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class UIHelper {
  static void showLoadingDialog(BuildContext context, String title) {
    AlertDialog loadingDialog = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 30),
          Text(title),
        ],
      ),
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return loadingDialog;
        });
  }

  static void showAlertDialog(
      BuildContext context, String title, String content) {
    AlertDialog alertDialog = AlertDialog(
      elevation: 12,
      backgroundColor: Color.fromARGB(255, 114, 36, 8),
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 23)),
      content: Text(content,
          style: TextStyle(
              color: Color.fromARGB(255, 244, 240, 240), fontSize: 20)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child:
              Text("OK", style: TextStyle(color: Colors.black, fontSize: 25)),
        )
      ],
    );
    showDialog(
        // barrierColor: Colors.white,
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
  //
  //

  static showAlertDialog1(BuildContext context, String title, String content) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.blue,
      title: Text(title, style: TextStyle(color: Colors.green)),
      content: Text(content, style: TextStyle(color: Colors.green)),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            final result = true;
          },
          child: Text(
            "Yes",
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
            final result = false;
          },
          child: Text(
            "No",
          ),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}
