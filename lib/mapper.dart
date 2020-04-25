import 'package:SortyQuizz/main/finishstep1/result_step1_type.dart';
import 'package:SortyQuizz/quizz/model/answer.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/shared/models/card.dart';
import 'package:SortyQuizz/shared/models/pack.dart';
import 'package:SortyQuizz/shared/models/pack_state.dart';
import 'package:SortyQuizz/shared/models/pack_type.dart';
import 'package:SortyQuizz/shared/models/sorting_type.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/models/value_type.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

void configMapper() {
  JsonMapper().useAdapter(JsonMapperAdapter(valueDecorators: {
    typeOf<List<Question>>(): (value) => value.cast<Question>(),
    typeOf<Set<Question>>(): (value) => value.cast<Question>(),
    typeOf<List<Answer>>(): (value) => value.cast<Answer>(),
    typeOf<Set<Answer>>(): (value) => value.cast<Answer>(),
    typeOf<List<UserPack>>(): (value) => value.cast<UserPack>(),
    typeOf<Set<UserPack>>(): (value) => value.cast<UserPack>(),
    typeOf<List<CardDTO>>(): (value) => value.cast<CardDTO>(),
    typeOf<Set<CardDTO>>(): (value) => value.cast<CardDTO>(),
    typeOf<List<Pack>>(): (value) => value.cast<Pack>(),
    typeOf<Set<Pack>>(): (value) => value.cast<Pack>()
  }, converters: {
    PackState: EnumConverter(PackState.values),
    PackType: EnumConverter(PackType.values),
    ValueType: EnumConverter(ValueType.values),
    SortingType: EnumConverter(SortingType.values),
    ResultStep : EnumConverter(ResultStep.values),
  }));
}

class EnumConverter implements ICustomConverter<dynamic> {
  List<dynamic> compareTO;

  EnumConverter(List<dynamic> compareTO) : super() {
    this.compareTO = compareTO;
  }

  @override
  dynamic fromJSON(jsonValue, [JsonProperty jsonProperty]) {
    String jsonValueString = jsonValue.toString().replaceAll('"', '');

    var found = compareTO.any((item) => item.toString().split('.').last == jsonValueString);
    if (found) {
      return compareTO.firstWhere((v) => jsonValueString == v.toString().split('.').last, orElse: () => null);
    } else {
      return null;
    }
  }

  @override
  String toJSON(dynamic object, [JsonProperty jsonProperty]) {
    if(object != null){
      return object.toString().split('.').last;
    } else {
      return '';
    }
  }
}
