// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec_blog/Models/MyColors.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: Assets.images.logo, height: 64),
              const SizedBox(
                height: 32,
              ),
              const SpinKitFadingCube(
                color: SolidColors.primaryColor,
                size: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}