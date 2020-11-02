import 'package:agro_app/Weather/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(84),
        child: Center(
          child: AppBar(
            centerTitle: true,
            title: Text(
              "AGRO_CONNECT",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.green[600],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Card(
              child: InkWell(
                child: Container(
                  color: Colors.black54,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.longestSide * 0.2,
                  child: Center(
                      child: Text(
                    "Weather around you",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoadingScreen()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: InkWell(
                child: Container(
                  color: Colors.black54,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.longestSide * 0.2,
                  child: Center(
                      child: Text(
                    "Know your Soil",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoadingScreen()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: InkWell(
                child: Container(
                  color: Colors.black54,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.longestSide * 0.2,
                  child: Center(
                      child: Text(
                    "Destroy the pest",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoadingScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
