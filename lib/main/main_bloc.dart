import 'dart:async';

import 'package:SortyQuizz/account/login/login_repository.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/mixins/validators_mixin.dart';
import 'package:SortyQuizz/shared/models/jwt_token.dart';
import 'package:SortyQuizz/shared/models/user_jwt.dart';
import 'package:SortyQuizz/shared/repository/http_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends Bloc with ValidatorMixin {
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _generalValidation = BehaviorSubject<bool>();
  final _isLoading = BehaviorSubject<bool>();

  final loginRepository = LoginRepository();

  Stream<String> get usernameStream =>
      _username.stream.transform(validateLogin);

  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);

  Stream<bool> get generalValidationStream => _generalValidation.stream;

  Stream<bool> get isLoadingStream => _isLoading.stream;

  Function(String) get changeLogin => _username.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(bool) get changeGeneralValidation => _generalValidation.sink.add;

  Stream<bool> get submitValid =>
      Rx.combineLatest2(usernameStream, passwordStream, (l, e) => true);

  static final String authenticationFailKey = 'error.authenticate';

  MainBloc() {
    _isLoading.sink.add(false);
  }

  Future<bool> authenticate() async {
    _isLoading.sink.add(true);
    final String username = _username.value;
    final String password = _password.value;

    bool validationOk = true;
    bool authenticationSucceed = false;

    if (validationOk) {
      UserJWT userToAuthenticate = new UserJWT(username, password);
      JWTToken token = await loginRepository.authenticate(userToAuthenticate);
      FlutterSecureStorage storage = new FlutterSecureStorage();
      await storage.delete(key: HttpUtils.keyForJWTToken);
      await storage.write(key: HttpUtils.keyForJWTToken, value: token.idToken);
      authenticationSucceed = true;
    }

    if (!authenticationSucceed) {
      _generalValidation.sink.addError(authenticationFailKey);
    }

    _isLoading.sink.add(false);
    return authenticationSucceed;
  }

  @override
  void dispose() => () {
        _username.close();
        _password.close();
        _generalValidation.close();
        _isLoading.close();
      };
}
