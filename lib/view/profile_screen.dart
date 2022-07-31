import 'package:flutter/material.dart';
import 'package:tec_blog/components/my_strings.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/gen/assets.gen.dart';

import '../components/my_components.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: Assets.images.profileAvatar,height: 100,),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(Assets.icons.penIcon,color: SolidColors.seeMore,),
                const SizedBox(width: 8,),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.headline3,
                )
              ],
            ),
            const SizedBox(height: 60,),
            Text("فاطمه امیری",style: textTheme.headline4,),
            Text("fatemehamiri@gmail.com",style: textTheme.headline4,),
            const SizedBox(height: 40,),
            TechDivider(size: size),
            InkWell(
              splashColor: SolidColors.primaryColor,
              onTap: (){
                // sth will happen
              },
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavoriteBlogs,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              splashColor: SolidColors.primaryColor,
              onTap: (){
                // sth will happen
              },
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavoritePodcasts,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              splashColor: SolidColors.primaryColor,
              onTap: (){
                // sth will happen
              },
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.logOut,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70,)
          ],
        ),
      ),
    );
  }
}
