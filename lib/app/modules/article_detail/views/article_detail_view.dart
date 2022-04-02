import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:get/get.dart';
import 'package:it_venture_test/app/modules/home/controllers/home_controller.dart';
import 'package:it_venture_test/utils/app_colors.dart';

import '../controllers/article_detail_controller.dart';

class ArticleDetailView extends GetView<ArticleDetailController> {
  final articleDetailController = Get.put(ArticleDetailController());
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    articleDetailController.context = context;
    homeController.context = context;
    final difference = new DateTime.now().difference(
        DateTime.parse('${homeController.selectedArticle.value.publishedAt}'));
    final substract = new DateTime.now()
        .subtract(new Duration(minutes: difference.inMinutes));
    final articles = homeController.selectedArticle.value;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'News Details',
            style: TextStyle(
              color: AppColors.whiteColorBackground,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: homeController.selectedArticle.value.index.toString(),
                child: ClipRRect(
                  child: CachedNetworkImage(
                    height: 300.h,
                    imageUrl: homeController.selectedArticle.value.urlToImage!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articles.title!,
                      style: TextStyle(
                        color: AppColors.appBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "Source - ${articles.source!.name!}",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text("${timeago.format(substract)}"),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          size: 25.w,
                          //color: AppColors.appBlackColor1,
                        ),
                        Icon(
                          Icons.more_vert,
                          color: AppColors.appBlackColor1,
                          size: 25.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Descripton:",
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.appBlackColor,
                      ),
                    ),
                    Text(
                      articles.description!,
                      style: TextStyle(
                        color: AppColors.appBlackColor1,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Similar News:",
                      style: TextStyle(
                        color: AppColors.appBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    similarNews()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Container similarNews() {
    return Container(
      height: 150.h,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var similarArticle = controller.similarArticles.value[index];
            return Card(
              child: Container(
                width: 200.w,
                height: 150.h,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: similarArticle.urlToImage!,
                        height: 100.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      similarArticle.title!,
                      style: TextStyle(
                        color: AppColors.appBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,

                        // fontFamily: AssetStrings.poppinsRegular,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => SizedBox(
            width: 5.w,
          ),
          itemCount: controller.similarArticles.value.length,
        ),
      ),
    );
  }
}
