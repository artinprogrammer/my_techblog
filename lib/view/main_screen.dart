import 'package:flutter/material.dart';
import 'package:tec_blog/Models/MyColors.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/view/home_screen.dart';
import 'package:tec_blog/view/profile_screen.dart';
import 'package:tec_blog/view/register_intro.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
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
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "گیت هاب تک بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
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
                child: IndexedStack(
              index: selectedPageIndex,
              children: [
                HomeScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ProfileScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                RegisterIntro(size: size, textTheme: textTheme, bodyMargin: bodyMargin)
              ],
            )),
            BottomNav(
              size: size,
              bodyMargin: bodyMargin,
              selectedPageIndex: selectedPageIndex,
              changeMainScreen: (int index) {
                setState(() {
                  selectedPageIndex = index;
                });
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => changeMainScreen(0),
                        icon: ImageIcon(
                          Assets.icons.home,
                          color: selectedPageIndex == 0
                              ? Colors.blue
                              : Colors.white,
                        )),
                    selectedPageIndex == 0
                        ? const Text(
                            "Home",
                            style: TextStyle(color: Colors.blue),
                          )
                        : const SizedBox()
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          changeMainScreen(2);
                        },
                        icon: ImageIcon(
                          Assets.icons.write,
                          color: selectedPageIndex == 2 ? Colors.red : Colors.white,
                        )),
                    selectedPageIndex == 2 ?
                    Text("Write",style: TextStyle(color: Colors.red),):
                    SizedBox()
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => changeMainScreen(1),
                        icon: ImageIcon(
                          Assets.icons.user,
                          color: selectedPageIndex == 1
                              ? Colors.green
                              : Colors.white,
                        )),
                    selectedPageIndex == 1
                        ? const Text(
                            "Acount",
                            style: TextStyle(color: Colors.green),
                          )
                        : const SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
