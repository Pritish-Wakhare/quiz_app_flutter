import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyApp extends StatefulWidget {
  static final style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/img/1.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              Text(
                "Hi",
                style: MyApp.style,
              ),
              Text(
                "I am ",
                style: MyApp.style,
              ),
              Text(
                "PriTish",
                style: MyApp.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.deepPurpleAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/img/1.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              Text(
                "CONSISTENCY",
                style: MyApp.style,
              ),
              Text(
                "IS",
                style: MyApp.style,
              ),
              Text(
                "KEY",
                style: MyApp.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.pinkAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/img/1.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              Text(
                "BE",
                style: MyApp.style,
              ),
              // Text(
              //   "Fork!",
              //   style: MyApp.style,
              // ),
              Text(
                "PRODUCTIVE",
                style: MyApp.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.yellowAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/img/1.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              Text(
                "BELIVE ",
                style: MyApp.style,
              ),
              Text(
                "IN",
                style: MyApp.style,
              ),
              Text(
                "YOURSELF",
                style: MyApp.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.deepPurpleAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/img/1.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              Text(
                "NEVER",
                style: MyApp.style,
              ),
              Text(
                "GIVE",
                style: MyApp.style,
              ),
              Text(
                "UP",
                style: MyApp.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/img/1.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              Text(
                "JUST",
                style: MyApp.style,
              ),
              Text(
                "DO",
                style: MyApp.style,
              ),
              Text(
                "IT",
                style: MyApp.style,
              ),
            ],
          ),
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              positionSlideIcon: 0.2,
              enableSlideIcon: true,
              slideIconWidget: Icon(Icons.arrow_back_ios),
              // onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              ignoreUserGestureWhileAnimating: true,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, _buildDot),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
