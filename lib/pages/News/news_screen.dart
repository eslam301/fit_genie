import 'package:fitgenie/layout/basic_layout_page.dart';
import 'package:fitgenie/pages/News/news_api_config/news_api_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_api_config/source_model.dart';
import 'news_details_view_screen.dart';
import 'news_widget/artical_widget_view.dart';

class NewsView extends StatefulWidget {
  static const String routeName = '/news_screen';
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.newspaper_rounded,
                  color: Theme.of(context).colorScheme.secondary, size: 30),
              const SizedBox(width: 10),
              Text('News Headlines',
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ).paddingOnly(left: 20, top: 20),
          FutureBuilder(
              future: NewsApiManger.fetchSource(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Error Check your connection'),
                          SizedBox(width: 10),
                          Icon(
                            Icons.wifi_off,
                            size: 30,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            NewsApiManger.fetchSource();
                          });
                        },
                        icon: const Icon(Icons.refresh_sharp),
                      )
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Loading...', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 20),
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  ArticleModel articlesModel = snapshot.data as ArticleModel;
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 210.0),
                      controller: ScrollController(),
                      itemCount: articlesModel.articles!.length > 30
                          ? 30
                          : articlesModel.articles!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ArticleWidget(
                          onTap: () {
                            Get.to(() => LayOutPageView(
                                  appBarTitle: 'News Details',
                                  body: ArticleDetails(
                                    articlesModel: articlesModel,
                                    index: index,
                                  ),
                                ));
                          },
                          articlesModel: articlesModel,
                          index: index,
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No data found'),
                  );
                }
              }),
        ],
      ),
    );
  }
}
