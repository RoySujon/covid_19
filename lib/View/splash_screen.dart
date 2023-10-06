import 'dart:math';

import 'package:covid_19/View/world_state.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorldStates(),
        )));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Transform.rotate(
                angle: _controller.value * 2.0 * pi, child: child),
            child: Center(
                child: Image.asset(
              'images/virus.png',
              height: 100,
              // width: 50,
              fit: BoxFit.cover,
            )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          Text(
            'Covid-19\nTrancker App',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
