import 'package:final_project/screens/country.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'home_page.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomePage(),
      duration: 3000,
      imageSize: 130,
      text: "DSC World",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.green,
        Colors.red,
      ],
      imageSrc: "assets/images/logo.jpg",
      backgroundColor: Colors.white,
    );
  }
}
