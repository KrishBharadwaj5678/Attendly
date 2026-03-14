import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:attendance_calculator/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: "assets/icon/splash.png",
        nextScreen: Home(),
        backgroundColor: Colors.white,
        centered: true,
        splashIconSize: 200,
        duration: 1800,
      ),
    );
  }
}
