import 'package:flutter/material.dart';
import 'package:tec_blog/Models/MyColors.dart';
import 'package:tec_blog/Models/MyStrings.dart';
import 'package:tec_blog/Models/fake_data.dart';
import 'package:tec_blog/gen/assets.gen.dart';

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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    // poster
                    Stack(
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
                                colors: gradiantColors.homePosterCoverGradiant,
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
                                "دوازده قدم برنامه نویسی یک دوره ی...س",
                                style: textTheme.headline1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // tag list
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tagList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 8, index == 0 ? bodyMargin : 15, 8),
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  gradient: LinearGradient(
                                      colors: gradiantColors.tags,
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 8, 8),
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
                                        tagList[index].title,
                                        style: textTheme.headline2,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    // blog see more
                    Padding(
                      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                      child: Row(
                        children: [
                          ImageIcon(
                            Assets.icons.penIcon,
                            color: solidColors.seeMore,
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
                    ),
                    // blogList
                    SizedBox(
                      height: size.height / 3.5,
                      child: ListView.builder(
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
                                                        gradiantColors.blogPost,
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
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    // podacst see more
                    Padding(
                      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                      child: Row(
                        children: [
                          ImageIcon(
                            Assets.icons.micIcon,
                            color: solidColors.seeMore,
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
                    ),
                    // podcasts list
                    SizedBox(
                      height: size.height / 3.5,
                      child: ListView.builder(
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
                    ),
                    // bottom navbar
                  ],
                ),
              ),
            ),
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
                  padding: const EdgeInsets.only(right: 8, left: 8),
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
