import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/controller/home_screen_controller.dart';
import '../Models/fake_data.dart';
import '../components/my_colors.dart';
import '../components/my_strings.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import '../components/my_components.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: homeScreenController.loading.value == false? 
          Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                homePagePoster(),
                const SizedBox(
                  height: 16,
                ),
                tags(),
                const SizedBox(
                  height: 32,
                ),
                SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
                topVisited(),
                const SizedBox(
                  height: 32,
                ),
                SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
                topPodcast(),
                const SizedBox(
                  height: 100,
                ),
              ],
            ):
          const Center(child: loading()),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisited.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              // blog Item
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                homeScreenController.topVisited[index].image!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                                foregroundDecoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: GradienColors.blogPost,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                              );
                            },
                            placeholder: (context, url) {
                              return const loading();
                            },
                            errorWidget: (context, url, error) {
                              return Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.grey,
                                size: 50,
                              );
                            },
                          ),
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisited[index].author!,
                                      style: textTheme.subtitle1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          homeScreenController
                                              .topVisited[index].view!,
                                          style: textTheme.subtitle1,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        homeScreenController.topVisited[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ))
                ],
              ),
            );
          },
        ),
    );
  }

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topPodcast.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                child: Column(
                  children: [
                    // the picture container
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: size.width / 2.4,
                          height: size.height / 5.3,
                          child: CachedNetworkImage(
                            imageUrl:
                                homeScreenController.topPodcast[index].poster!,
                            imageBuilder: ((context, imageProvider) =>
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                )),
                            placeholder: ((context, url) =>
                                const loading()),
                            errorWidget: ((context, url, error) => const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                )),
                          )),
                    ),

                    SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        homeScreenController.topPodcast[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              );
            }),
    );
  }

  Widget homePagePoster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: ((context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                )),
            placeholder: ((context, url) => const loading()),
            errorWidget: ((context, url, error) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 50,
                  color: Colors.grey,
                )),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
                colors: GradienColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 8,
          child: Column(
            children: [
              Text(
                homeScreenController.poster.value.title!,
                style: textTheme.headline1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tags(){
    return SizedBox(
      height: 60,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.tagsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(textTheme: textTheme, index: index),
            );
          }),
    );
  }
}


class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.micIcon,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewViralPodcast,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.penIcon,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewViralBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

