import 'package:SortyQuizz/quizz/model/answer.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';


void configMapper() {
  JsonMapper().useAdapter(JsonMapperAdapter(valueDecorators: {
    typeOf<List<Question>>(): (value) => value.cast<Question>(),
    typeOf<Set<Question>>(): (value) => value.cast<Question>(),
    typeOf<List<Answer>>(): (value) => value.cast<Answer>(),
    typeOf<Set<Answer>>(): (value) => value.cast<Answer>()
  }));
}
