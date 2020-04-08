import 'package:SortyQuizz/shared/models/jwt_token.dart';
import 'package:SortyQuizz/shared/models/user_jwt.dart';
import 'package:SortyQuizz/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class LoginRepository {
  LoginRepository();

  Future<JWTToken> authenticate(UserJWT userJWT) async {
    final authenticateRequest = await HttpUtils.postRequest<UserJWT>("/authenticate", userJWT);
    return JsonMapper.deserialize<JWTToken>(authenticateRequest.body);
  }
}
