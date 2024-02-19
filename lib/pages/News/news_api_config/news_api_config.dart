import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fitgenie/pages/News/news_api_config/source_model.dart';

class NewsApiManger {
  static Future<SourceModel> fetchSource(String categoryId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": Constants.apiKey,
      "category": categoryId
    };

    Uri uri = Uri.https(
        Constants.baseUrl, '/v2/top-headlines/sources', queryParameters);

    final response = await http.get(uri);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['status'] == 'ok') {
      return SourceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class Constants {
  static const String apiKey = '86eed46064e9407aa56f8168e620b5ce';
  static const String baseUrl = 'newsapi.org';
}
