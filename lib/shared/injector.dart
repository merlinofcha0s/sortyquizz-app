import 'package:SortyQuizz/shared/repository/http_utils.dart';

class Injector {
  static HttpUtils _httpUtils;

  Injector();

  static HttpUtils getHttpUtils() {
    if (_httpUtils == null) {
      _httpUtils = new HttpUtils();
    }
    return _httpUtils;
  }
}
