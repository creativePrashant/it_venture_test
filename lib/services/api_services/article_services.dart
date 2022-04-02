import 'package:it_venture_test/models/article/article_list_response.dart';
import 'package:it_venture_test/models/error.dart';
import 'package:it_venture_test/network/api_s.dart';
import 'package:it_venture_test/services/repositories/articile_repositories.dart';

import '../../network/api_handler.dart';

class ArticleRepoImplementation implements ArticleRepo {
  @override
  Future getArticles() async {
    final response = await APIHandler.get(url: APIs.articles);
    if (response is APIError) {
      return response;
    } else {
      return ArtilcleListResponse.fromJson(response);
    }
  }

  @override
  Future getSimilarArticles() async {
    final response = await APIHandler.get(url: APIs.similarNews);
    if (response is APIError) {
      return response;
    } else {
      return ArtilcleListResponse.fromJson(response);
    }
  }
}
