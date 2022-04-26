import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec_blog/MyColors.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/mainPage.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MainScreen()));
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
                color: solidColors.primaryColor,
                size: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
