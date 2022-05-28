import 'package:flutter/material.dart';
import 'package:tec_blog/Models/MyColors.dart';
import 'package:tec_blog/Models/MyStrings.dart';
import 'package:tec_blog/Models/fake_data.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/view/home_screen.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // needed vars
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 12;
    // the UI
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: solidColors.scafoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Image(
                image: Assets.images.logo,
                width: size.height / 9.6,
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            homeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
            // bottom navigation
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height / 10,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: gradiantColors.bottomNavBackground,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Padding(
                  padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                  child: Container(
                    height: size.height / 8,
                    decoration: const BoxDecoration(
                        gradient:
                            LinearGradient(colors: gradiantColors.bottomNav),
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              Assets.icons.home,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              Assets.icons.write,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              Assets.icons.user,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}