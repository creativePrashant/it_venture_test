import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_venture_test/models/article/article_list_response.dart';
import 'package:it_venture_test/services/api_services/article_services.dart';
import 'package:it_venture_test/services/repositories/articile_repositories.dart';

class ArticleDetailController extends GetxController {
  //TODO: Implement ArticleDetailController
  BuildContext? context;
  RxList<Articles> similarArticles = <Articles>[].obs;
  ArticleRepo? articleRepo;
  @override
  void onInit() {
    super.onInit();
    articleRepo = Get.put(ArticleRepoImplementation());
    getSimilarArticles();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getSimilarArticles() async {
    var response = await articleRepo!.getSimilarArticles();
    if (response is ArtilcleListResponse) {
      similarArticles.value = response.articles!;
    }
  }
}
