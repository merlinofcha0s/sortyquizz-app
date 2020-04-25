import 'package:SortyQuizz/main/sortcard/finish_step2_model.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class CardRepository {
  CardRepository();

  Future<UserPack> validateSorting(FinishStep2DTO step2dto) async {
    final validateSorting = await HttpUtils.postRequest('/cards/validate-sort', step2dto);
    return JsonMapper.deserialize<UserPack>(validateSorting.body);
  }
}
