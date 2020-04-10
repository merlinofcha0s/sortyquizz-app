import 'dart:convert' show json;

import 'package:SortyQuizz/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class PackRepository {
  PackRepository();

  Future<int> getCountOpenPackForConnectedUser() async {
    final registerRequest = await HttpUtils.getRequest("/user-packs/get-count-number-by-user");
    final body = json.decode(HttpUtils.encodeUTF8(registerRequest.body));
    return JsonMapper.deserialize<int>(body);
  }
}
