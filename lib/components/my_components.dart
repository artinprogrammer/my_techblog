import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/controller/home_screen_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../gen/assets.gen.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({Key? key, required this.textTheme, required this.index})
      : super(key: key);

  final TextTheme textTheme;
  var index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
            colors: GradienColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtagIcon,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              Get.find<HomeScreenController>().tagsList[index].title!,
              style: textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);

  await launchUrl(uri);
    
}

class loading extends StatelessWidget {
  const loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
          color: SolidColors.primaryColor,
          size: 32,
        );
  }
}