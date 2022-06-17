import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec_blog/Models/MyColors.dart';
import 'package:tec_blog/Models/MyStrings.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
    const RegisterIntro({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;
  @override
  Widget build(BuildContext context) {
    return Center(
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
                  _showEmailBottomSheet(context, size, textTheme);
                },
                child: const Text(
                  "بزن بریم",
                  // style: textTheme.headline1,
                ),
              ),
            )
          ],
        ),
      );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        // let the user scroll bottom sheet and it doesn't overflow
        backgroundColor: Colors
            .transparent, // bottom sheet color is white and it doesn't show the border radius
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
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
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: TextField(
                        onChanged: (value) {
                          print(value +
                              " is email: " +
                              isEmail(value).toString());
                        },
                        style: textTheme.headline5,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "techblog@gmail.com",
                          hintStyle: textTheme.headline5,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _activateCodeBottomSheet(context, size, textTheme);
                      },
                      child: const Text("ادامه"),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        // let the user scroll bottom sheet and it doesn't overflow
        backgroundColor: Colors
            .transparent, // bottom sheet color is white and it doesn't show the border radius
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
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
                      MyStrings.activateCode,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: TextField(
                        onChanged: (value) {
                          print(value +
                              " is email: " +
                              isEmail(value).toString());
                        },
                        style: textTheme.headline5,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "******",
                          hintStyle: textTheme.headline5,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const MyCats())));
                      },
                      child: Text("ادامه"),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
