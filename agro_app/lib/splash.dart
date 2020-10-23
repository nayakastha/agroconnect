import 'package:agro_app/Weather/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.longestSide * 0.02,
              width: double.maxFinite,
              child: Card(
                elevation: 10,
                child: Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget cardChild(
    ImageProvider image, String text, BuildContext context, onclick) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Stack(
        children: <Widget>[cardImage(image, context), cardText(text, context)],
      ),
    ),
  );
}

Widget cardImage(ImageProvider img, BuildContext context) {
  return Container(
    alignment: FractionalOffset.centerLeft,
    child: Image(
      image: img,
      height: MediaQuery.of(context).size.longestSide * 0.01,
      width: MediaQuery.of(context).size.longestSide * 0.01,
    ),
  );
}

Widget cardText(String text, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.longestSide * 0.18,
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 24),
    ),
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );
}
