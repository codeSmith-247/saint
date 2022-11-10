import 'package:flutter/material.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              "assets/picture.jpg",
              fit: BoxFit.contain,
            ),
            Text(
              "Let's Cruise To Your Destination ",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 8, 108, 190),
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ));
  }
}
