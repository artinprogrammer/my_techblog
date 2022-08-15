import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec_blog/components/api_constant.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/components/my_components.dart';
import 'package:tec_blog/components/my_strings.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/services/dio_service.dart';
import 'package:tec_blog/view/home_screen.dart';
import 'package:tec_blog/view/profile_screen.dart';
import 'package:tec_blog/view/register_intro.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    // needed vars
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 12;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                  child: Image.asset(
                    Assets.images.logo.path,
                    scale: 3,
                  ),
                )),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.headline4,
                  ),
                  onTap: () {
                    _key.currentState!.closeDrawer();
                  },
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "درباره تک بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () async{
                    await Share.share(MyStrings.shareText);
                  },
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "گیت هاب تک بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {
                    myLaunchUrl(MyStrings.techBlogGithubUrl);
                  },
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColors.scafoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
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
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ProfileScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  RegisterIntro(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin)
                ],
              ),
            )),
            BottomNav(
              size: size,
              bodyMargin: bodyMargin,
              selectedPageIndex: selectedPageIndex,
              changeMainScreen: (int index) {
                selectedPageIndex.value = index;
              },
            )
          ],
        ),
      ),
    );
  }
}


class BottomNav extends StatelessWidget {
  const BottomNav(
      {Key? key,
      required this.size,
      required this.bodyMargin,
      required this.changeMainScreen,
      required this.selectedPageIndex})
      : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeMainScreen;
  final selectedPageIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradienColors.bottomNavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: GradienColors.bottomNav),
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeMainScreen(0),
                  icon: ImageIcon(
                    Assets.icons.home,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    changeMainScreen(2);
                  },
                  icon: ImageIcon(
                    Assets.icons.write,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () => changeMainScreen(1),
                  icon: ImageIcon(
                    Assets.icons.user,
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
