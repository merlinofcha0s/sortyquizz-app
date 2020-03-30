import 'package:SortyQuizz/environement.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:SortyQuizz/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class QuestionsRepository {
  QuestionsRepository();

  Future<List<Question>> start(int lvl) async {
    debugPrint("Calling the API for getting questions.............");
    final startRequest = await http.get(Constants.api + "/questions/start/$lvl");
    final body = json.decode(HttpUtils.encodeUTF8(startRequest.body));
    return JsonMapper.deserialize<List<Question>>(body);
  }
}
