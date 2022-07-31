import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/view/main_screen.dart';
import 'package:tec_blog/view/my_cats.dart';
import 'package:tec_blog/view/register_intro.dart';
import 'package:tec_blog/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.navigationColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        var textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa', '') //farsi,
        ],
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: textTheme.headline5,
              border:  const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)),borderSide: BorderSide(width: 2)),
              filled: true,
              fillColor: Colors.white
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return textTheme.subtitle1;
                }
                return textTheme.subtitle2;
              }), backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return SolidColors.seeMore;
                }
                return SolidColors.primaryColor;
              })),
            ),


            fontFamily: 'dana',
            brightness: Brightness.light,
            textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: SolidColors.posterTitle),
              headline2: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
              subtitle1: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: SolidColors.posterSubTitle),
              headline3: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: SolidColors.seeMore,
              ),
              headline4: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 70, 70, 70),
              ),              
              headline5: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: SolidColors.hintText,
              ),
            )),
        // home: splashScreen());
        home: const MainScreen());
  }
}
