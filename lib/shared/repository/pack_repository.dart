import 'package:SortyQuizz/shared/models/pack.dart';
import 'package:SortyQuizz/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class PackRepository {
  PackRepository();

  Future<Pack> getPackByIdByConnectedUser(int userPackId) async {
    final packByUserPackIdRequest = await HttpUtils.getRequest('/packs/get-by-userpackid-and-user/$userPackId');
    var body = HttpUtils.adaptEnumForDeserialization(packByUserPackIdRequest.body, 'type', 'PackType', false);
    return JsonMapper.deserialize<Pack>(body);
  }
}
