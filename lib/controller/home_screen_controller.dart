import 'package:get/get.dart';
import 'package:tec_blog/components/api_constant.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/models/podcast_model.dart';
import 'package:tec_blog/models/poster_model.dart';
import 'package:tec_blog/models/tags_model.dart';
import 'package:tec_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    getHomeItems();
    super.onInit();
  }

  late Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisited = RxList();
  RxList<PodcastModel> topPodcast = RxList();
  RxBool loading = false.obs;
  getHomeItems() async {
    loading.value = true;

    var response = await DioService().getMethod(ApiConstant.homeItemsUrl);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((json) {
        topVisited.add(ArticleModel.fromJson(json));
      });


      response.data['top_podcasts'].forEach((json) {
        topPodcast.add(PodcastModel.fromJson(json));
      });

      poster.value = PosterModel.fromJson(response.data["poster"]);

      loading.value = false;
    }
  }
}
