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
    var size = MediaQuery.of(context).size;
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
                        text: MyStrings.welcom, style: textTheme.headline4
                        // style: Te
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      // let the user scroll bottom sheet and it doesn't overflow
                        backgroundColor: Colors
                            .transparent, // bottom sheet color is white and it doesn't show the border radius
                        context: context,
                        builder: ((context) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            // view insets means the time that we are using keyboard
                            child: Container(
                              height: size.height / 2,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      MyStrings.insertYourEmail,
                                      style: textTheme.headline4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(24,24,24,0),
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          hintText: "techblog@gmail.com",
                                          hintStyle: textTheme.headline5,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: (){},
                                      child: Text("ادامه"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }));
                  },
                  child: const Text(
                    "بزن بریم",
                    // style: textTheme.headline1,
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
