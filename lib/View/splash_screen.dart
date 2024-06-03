import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lr_api_test/View/world_state_screen.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WorldStateScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              child: Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    "images/virus.png",
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: controller.value * 2.0 * math.pi,
                  child: child,
                );
              },
            ),
            SizedBox(height: 30,),
            Text("Covid Tracker App",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
