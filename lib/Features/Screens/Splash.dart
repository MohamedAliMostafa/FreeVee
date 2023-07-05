import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Layout/HomeLayout.dart';

class Splash extends StatelessWidget {
static const String routeName="splah";
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splashIconSize: 150,
      splash: Container(
        margin:  REdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2.w),
          borderRadius: BorderRadius.circular(18.r),
          image: const DecorationImage(image: AssetImage("assets/images/mov.jpeg"))
        ),
      ),
      nextScreen: HomeLayout(),
      splashTransition: SplashTransition.slideTransition,

    );
  }
}
