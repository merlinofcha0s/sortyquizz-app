import 'dart:convert' show json;

import 'package:SortyQuizz/environement.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:http/http.dart' as http;

class QuestionsRepository {
  QuestionsRepository();

  Future<List<Question>> start(int lvl) async {
    final startRequest = await http.get(Constants.api + "/questions/start/$lvl");
    final body = json.decode(HttpUtils.encodeUTF8(startRequest.body));
    return JsonMapper.deserialize<List<Question>>(body);
  }
}
