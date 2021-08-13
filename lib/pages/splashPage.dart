import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'loginPage/loginPage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(right: 32.0, left: 32.0),
        child: AnimatedSplashScreen.withScreenFunction(
          splash: "assets/appLogo/blue_long.png",
          screenFunction: () async {
            return LoginPage();
          },
          duration: 3000,
          animationDuration: Duration(milliseconds: 600),
          centered: true,
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}
