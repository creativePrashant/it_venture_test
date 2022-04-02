import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_venture_test/app/modules/article_detail/views/article_detail_view.dart';
import 'package:it_venture_test/models/article/article_list_response.dart';
import 'package:it_venture_test/services/api_services/article_services.dart';
import 'package:it_venture_test/services/repositories/articile_repositories.dart';
import 'package:it_venture_test/utils/memory_management.dart';

import '../../../../utils/easy_loading.dart';
import '../../../../utils/page_transition.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  BuildContext? context;
  ArticleRepo? articleRepo;
  CircularLoader _circularLoader = Get.put(CircularLoader());
  RxList<Articles> articles = <Articles>[].obs;
  var selectedArticle = Articles().obs;
  @override
  void onInit() {
    super.onInit();
    articleRepo = Get.put(ArticleRepoImplementation());
    fetchCache();
    Future.delayed(Duration(seconds: 1), () {
      getHeadLines();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getHeadLines() async {
    _circularLoader.showCircularLoader(context!);
    var response = await articleRepo!.getArticles();
    _circularLoader.hideCircularLoader();
    if (response is ArtilcleListResponse) {
      MemoryManagement.setOnboarding(status: true);
      articles.value = response.articles!;
      MemoryManagement.setOffLineNews(value: json.encode(response));
    }
  }

  fetchCache() async {
    bool onBoarding = false;
    try {
      onBoarding = MemoryManagement.getOnboarding();
    } catch (e, s) {}
    if (onBoarding) {
      var offlineArticles = jsonDecode(MemoryManagement.getOffLineNews());
      print(offlineArticles);
      var response = ArtilcleListResponse.fromJson(offlineArticles);
      articles.value = response.articles!;
    }
  }

  moveToDetailPage(Articles? articles, int index) {
    selectedArticle.value.index = index;
    selectedArticle.value = articles!;
    Get.to(
      () => ArticleDetailView(),
      transition: AppPageTransition.zoomPageTransition,
      duration: Duration(
        milliseconds: 400,
      ),
    );
  }
}
