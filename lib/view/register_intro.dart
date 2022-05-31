import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec_blog/Models/MyColors.dart';
import 'package:tec_blog/Models/MyStrings.dart';
import 'package:tec_blog/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.tcbot,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                    text: TextSpan(
                  text: MyStrings.welcom,
                  style: textTheme.headline4
                  // style: Te
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: (){},
                  child: const Text(
                    "بزن بریم",
                    // style: textTheme.headline1,
                  ),
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith((states){
                         if(states.contains(MaterialState.pressed)){
                           return textTheme.headline1;
                      }
                           return textTheme.subtitle1;
                    }),
                    backgroundColor: MaterialStateProperty.resolveWith((states){
                      if (states.contains(MaterialState.pressed)) {
                        return SolidColors.seeMore;
                      }
                        return SolidColors.primaryColor;
                    })
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
