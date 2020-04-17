import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class UserPackRepository {
  UserPackRepository();

  Future<int> getCountOpenPackForConnectedUser() async {
    final registerRequest = await HttpUtils.getRequest("/user-packs/get-count-number-by-user");
    return JsonMapper.deserialize<int>(HttpUtils.encodeUTF8(registerRequest.body));
  }

  Future<List<UserPack>> getAllPackForConnectedUser() async {
    final registerRequest = await HttpUtils.getRequest("/user-packs/get-by-user");
    var body = HttpUtils.adaptEnumForDeserialization(registerRequest.body, 'state', 'PackState', true);
    return JsonMapper.deserialize<List<UserPack>>(body);
  }

  Future<bool> completeUserPackForStep1(UserPack userPack) async {
    final completeStep1Request = await HttpUtils.postRequest<UserPack>("/user-packs/complete-step-1", userPack);
    return JsonMapper.deserialize<bool>(completeStep1Request.body);
  }
}
