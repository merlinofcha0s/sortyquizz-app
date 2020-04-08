import 'dart:async';

import 'package:SortyQuizz/account/register/account_repository.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/mixins/validators_mixin.dart';
import 'package:SortyQuizz/shared/models/user.dart';
import 'package:SortyQuizz/shared/repository/http_utils.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc with ValidatorMixin {
  final _login = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _generalValidation = BehaviorSubject<bool>();
  final _successLogin = BehaviorSubject<bool>();
  final _isLoading = BehaviorSubject<bool>();

  final accountRepository = AccountRepository();

  Stream<String> get loginStream => _login.stream.transform(validateLogin);

  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);

  Stream<bool> get generalValidationStream => _generalValidation.stream;

  Stream<bool> get successRegisterStream => _successLogin.stream;

  Stream<bool> get isLoadingStream => _isLoading.stream;

  Function(String) get changeLogin => _login.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(bool) get changeGeneralValidation => _generalValidation.sink.add;

  Function(bool) get changeSuccessRegister => _successLogin.sink.add;

  Stream<bool> get submitValid =>
      Rx.combineLatest2(loginStream, passwordStream, (l, e) => true);

  static final String passwordNotIdenticalKey = 'error.passwordnotidentical';
  static final String loginExistKey = 'error.userexists';
  static final String emailExistKey = 'error.emailexists';

  LoginBloc() {
    _isLoading.sink.add(false);
  }

  authenticate() async {
    _isLoading.sink.add(true);
    final String login = _login.value;
    final String password = _password.value;

    bool validationOk = true;
    bool loginSuccess = false;

    if (validationOk) {
      User newUser = new User.forLogin(login, password);
      String result = await accountRepository.register(newUser);
      if (result.compareTo(HttpUtils.successResult) != 0) {
        _generalValidation.addError(result);
      } else {
        loginSuccess = true;
      }
    }

    _successLogin.sink.add(loginSuccess);
    _isLoading.sink.add(false);
  }

  @override
  void dispose() => () {
        _login.close();
        _password.close();
        _generalValidation.close();
        _successLogin.close();
        _isLoading.close();
      };
}
