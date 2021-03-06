import 'package:flutter/material.dart';
import '../Models/fake_data.dart';
import '../components/my_colors.dart';
import '../components/my_strings.dart';
import 'package:tec_blog/gen/assets.gen.dart';

import '../components/my_components.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            
            HomePagePoster(size: size, textTheme: textTheme),
            
            const SizedBox(
              height: 16,
            ),
            
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
            
            const SizedBox(
              height: 32,
            ),
            
            SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
            
            HomePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            
            const SizedBox(
              height: 32,
            ),

            SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),

            HomePagePodcastList(size: size, bodyMargin: bodyMargin),
          
            const SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}


class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: podcastList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  // the picture container
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width / 2.4,
                      height: size.height / 5.3,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(16)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        podcastList[index]
                                            .imageUrl),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    ),
                  ),
                  // the title
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      podcastList[index].title,
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

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? bodyMargin : 15),
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
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(
                                      Radius.circular(16)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      blogList[index].imageUrl),
                                  fit: BoxFit.cover)),
                          foregroundDecoration:
                              const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors:
                                        GradienColors.blogPost,
                                    begin:
                                        Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(16))),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceAround,
                                children: [
                                  Text(
                                    blogList[index].writer,
                                    style: textTheme.subtitle1,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        blogList[index].views,
                                        style:
                                            textTheme.subtitle1,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons
                                            .remove_red_eye_sharp,
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
                      blogList[index].title,
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
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(textTheme: textTheme,index: index),
            );
          }),
    );
  }
}



class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(
                      homePagePosterMap["imageAsset"]),
                  fit: BoxFit.cover)),
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
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writter"] +
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["view"],
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "???????????? ?????? ???????????? ?????????? ???? ???????? ??...??",
                style: textTheme.headline1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}