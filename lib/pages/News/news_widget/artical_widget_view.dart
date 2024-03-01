import 'package:flutter/material.dart';

import '../news_api_config/source_model.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleModel articlesModel;
  final int index;
  final Function onTap;

  const ArticleWidget({super.key , required this.articlesModel,required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    String title = articlesModel.articles![index].title ?? '';
    bool isHaveImage = articlesModel.articles![index].urlToImage == null ? false : true;
    // String? date = articlesModel.articles![index].publishedAt?.split('T')[0];
    // String? time = articlesModel.articles![index].publishedAt?.split('T')[1].split('Z')[0];

    var theme = Theme.of(context );
    return isHaveImage?  GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.primaryColor,
                ),
                child: Image.network(
                  articlesModel.articles![index].urlToImage ?? '',
                  width: double.infinity,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(height: 200, child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error),
                      Text('Error Loading image')
                    ],
                  )),),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              articlesModel.articles![index].source!.name ?? 'no author',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),

            ),

            Text(
              title,
              style: theme.textTheme.titleLarge,
            ),
          ]
        ),
      ),
    ) : const SizedBox.shrink() ;
  }
}
