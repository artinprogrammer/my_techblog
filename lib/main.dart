import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec_blog/Models/MyColors.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/splash_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: solidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: solidColors.navigationColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('fa', '') //farsi,
        ],
        theme: ThemeData(
            fontFamily: 'dana',
            brightness: Brightness.light,
            textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: solidColors.posterTitle),
                  headline2: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w300
                  ),
              subtitle1: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color:solidColors.posterSubTitle),
                  headline3: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: solidColors.seeMore,
                  )
            )),
        home: splashScreen());
  }
}
