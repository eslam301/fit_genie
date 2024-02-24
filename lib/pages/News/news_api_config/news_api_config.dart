import 'dart:convert';

import 'package:fitgenie/pages/News/news_api_config/source_model.dart';
import 'package:http/http.dart' as http;

class NewsApiManger {


  static Future<ArticleModel> fetchSource() async {

    var queryParameters = {
      'apiKey': Constants.apiKey,
      'category': 'health',
      'language': 'en',
    };
    Uri uri = Uri.https(
        Constants.baseUrl,
        'v2/top-headlines',
        queryParameters
    );

    final response = await http.get(uri);

    if (response.statusCode == 200&&jsonDecode(response.body)['status'] == 'ok') {
      return ArticleModel.fromJson(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load Source');
    }

  }
  static Future<ArticleModel> fetchSourceAboutEgypt() async {

    var queryParameters = {
      'apiKey': Constants.apiKey,
      'sortBy': 'popularity',
      'q': 'fitness classes',
      'language': 'en',
    };
    Uri uri = Uri.https(
        Constants.baseUrl,
        'v2/everything',
        queryParameters
    );

    final response = await http.get(uri);

    if (response.statusCode == 200&&jsonDecode(response.body)['status'] == 'ok') {
      return ArticleModel.fromJson(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load Source');
    }

  }

}

class Constants {
  static const String apiKey = '86eed46064e9407aa56f8168e620b5ce';
  static const String baseUrl = 'newsapi.org';
}
