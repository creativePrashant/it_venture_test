import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_venture_test/models/article/article_list_response.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:get/get.dart';
import 'package:it_venture_test/utils/app_colors.dart';
import 'package:it_venture_test/utils/asset_strings.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    homeController.context = context;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'News',
            style: TextStyle(
              color: AppColors.whiteColorBackground,
              fontFamily: AssetStrings.poppinsRegular,
            ),
          ),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10.w),
            Icon(Icons.notifications),
            SizedBox(width: 10.w),
            Icon(Icons.person),
            SizedBox(width: 20.w),
          ],
        ),
        body: RefreshIndicator(
          color: AppColors.appBlackColor,
          onRefresh: () async {
            await controller.getHeadLines();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Obx(
              () => ListView.separated(
                  itemBuilder: (context, index) {
                    var articles = controller.articles.value[index];
                    final difference = new DateTime.now()
                        .difference(DateTime.parse('${articles.publishedAt}'));
                    final substract = new DateTime.now()
                        .subtract(new Duration(minutes: difference.inMinutes));

                    return NewsWidgetTile(
                      controller: controller,
                      articles: articles,
                      substract: substract,
                      index: index,
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                        height: 3.h,
                      ),
                  itemCount: controller.articles.value.length),
            ),
          ),
        ));
  }
}

class NewsWidgetTile extends StatelessWidget {
  const NewsWidgetTile(
      {Key? key,
      required this.controller,
      required this.articles,
      required this.substract,
      required this.index})
      : super(key: key);

  final HomeController controller;
  final Articles articles;
  final DateTime substract;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                controller.moveToDetailPage(articles, index);
              },
              child: Hero(
                tag: index.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: articles.urlToImage!,
                  ),
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
                      // fontFamily: AssetStrings.poppinsRegular,
                    ),
                  ),
                  Divider(),
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
                    height: 2.h,
                  ),
                  Text("${timeago.format(substract)}"),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
