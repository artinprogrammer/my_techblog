import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec_blog/components/my_strings.dart';
import 'package:tec_blog/Models/fake_data.dart';
import 'package:tec_blog/controller/home_screen_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/components/my_components.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:get/get.dart';
import 'package:tec_blog/models/tags_model.dart';
import 'package:tec_blog/view/home_screen.dart';

class MyCats extends StatefulWidget {
  const MyCats({Key? key}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  RxList<TagsModel> tagsList = Get.find<HomeScreenController>().tagsList;
  RxList<TagsModel> selectedTags = RxList();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  Assets.images.tcbot,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  MyStrings.successfulRegistration,
                  style: textTheme.headline4,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.headline4),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  MyStrings.chooseCats,
                  style: textTheme.headline4,
                ),
                const SizedBox(
                  height: 32,
                ),
                // tag list
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 85,
                    child: GridView.builder(
                        // it clamp this scroll with the singlechild scroll
                        physics: const BouncingScrollPhysics(),
                        itemCount: tagList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2, // the lines of grid
                                childAspectRatio: 0.3),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                if (!selectedTags.contains(tagsList[index])) {
                                  selectedTags.add(tagsList[index]);
                                }
                              },
                              child:
                                  MainTags(textTheme: textTheme, index: index));
                        }),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  "assets/icons/down_cat_arrow.png",
                  scale: 3,
                ),
                const SizedBox(
                  height: 32,
                ),
                // my cats list
                SizedBox(
                  height: 85,
                  child: Obx(
                    () => GridView.builder(
                        // it clamp this scroll with the singlechild scroll
                        physics: const ClampingScrollPhysics(),
                        itemCount: selectedTags.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2, // the lines of grid
                                childAspectRatio: 0.2),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: SolidColors.surface),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    selectedTags[index].title!,
                                    style: textTheme.headline4,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      selectedTags.removeAt(index);
                                    },
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
