import 'package:SortyQuizz/shared/models/user.dart';
import 'package:SortyQuizz/shared/repository/http_utils.dart';

class LoginRepository {
  LoginRepository();

  Future<String> authenticate(User newUser) async {
    final registerRequest =
    await HttpUtils.postRequest<User>("/register", newUser);

    String result;

    if (registerRequest.statusCode == 400) {
      result = registerRequest.headers[HttpUtils.errorHeader];
    } else {
      result = HttpUtils.successResult;
    }

    return result;
  }
}
