
import 'package:news_app/api_key.dart';
import 'package:news_app/api_response.dart';
 import 'package:dio/dio.dart';

class NewsService {
  Future<ApiResponse> fetchNews(String searchString) async {
    final apiKey = ApiKey().apiKey;
    final url =
        'https://newsapi.org/v2/everything?q=$searchString&apiKey=$apiKey';

    final dio = Dio();
    
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load news');
    }
  }
}