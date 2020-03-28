import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'models/answer.dart';
import 'models/question.dart';

void configMapper() {
  JsonMapper().useAdapter(JsonMapperAdapter(valueDecorators: {
    typeOf<List<Question>>(): (value) => value.cast<Question>(),
    typeOf<Set<Question>>(): (value) => value.cast<Question>(),
    typeOf<List<Answer>>(): (value) => value.cast<Answer>(),
    typeOf<Set<Answer>>(): (value) => value.cast<Answer>()
  }));
}
