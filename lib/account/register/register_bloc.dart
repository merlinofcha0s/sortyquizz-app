import 'dart:async';

import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/mixins/validators_mixin.dart';
import 'package:SortyQuizz/shared/models/user.dart';
import 'package:SortyQuizz/shared/repository/http_utils.dart';
import 'package:rxdart/rxdart.dart';

import 'account_repository.dart';

class RegisterBloc extends Bloc with ValidatorMixin {
  final _login = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _termsAndConditions = BehaviorSubject<bool>();
  final _generalValidation = BehaviorSubject<bool>();
  final _successRegister = BehaviorSubject<bool>();
  final _isLoading = BehaviorSubject<bool>();

  final accountRepository = AccountRepository();

  Stream<String> get loginStream => _login.stream.transform(validateLogin);

  Stream<String> get emailStream => _email.stream.transform(validateEmail);

  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);

  Stream<String> get confirmPasswordStream => _confirmPassword.stream;

  Stream<bool> get termsAndConditionsStream =>
      _termsAndConditions.stream.transform(validateTermsAndCondition);

  Stream<bool> get generalValidationStream => _generalValidation.stream;

  Stream<bool> get successRegisterStream => _successRegister.stream;

  Stream<bool> get isLoadingStream => _isLoading.stream;

  Function(String) get changeLogin => _login.sink.add;

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;

  Function(bool) get changeTermsAndConditions => _termsAndConditions.sink.add;

  Function(bool) get changeGeneralValidation => _generalValidation.sink.add;

  Function(bool) get changeSuccessRegister => _successRegister.sink.add;

  Stream<bool> get submitValid => Rx.combineLatest5(
      loginStream,
      emailStream,
      passwordStream,
      confirmPasswordStream,
      termsAndConditionsStream,
      (l, e, p, cp, tc) => true);

  static final String passwordNotIdenticalKey = 'error.passwordnotidentical';
  static final String loginExistKey = 'error.userexists';
  static final String emailExistKey = 'error.emailexists';

  RegisterBloc() {
    _isLoading.sink.add(false);
  }

  submit() async {
    _isLoading.sink.add(true);
    final String login = _login.value;
    final String email = _email.value;
    final String password = _password.value;
    final String confirmPassword = _confirmPassword.value;

    bool validationOk = true;
    bool registerSuccess = false;

    if (password.compareTo(confirmPassword) != 0) {
      validationOk = false;
      _generalValidation.addError(passwordNotIdenticalKey);
    } else {
      validationOk = true;
      _generalValidation.add(true);
    }

    if (validationOk) {
      User newUser = new User(login, email, password, 'en');
      String result = await accountRepository.register(newUser);
      if (result.compareTo(HttpUtils.successResult) != 0) {
        _generalValidation.addError(result);
      } else {
        registerSuccess = true;
      }
    }

    _successRegister.sink.add(registerSuccess);
    _isLoading.sink.add(false);
  }

  @override
  void dispose() => () {
        _login.close();
        _email.close();
        _password.close();
        _confirmPassword.close();
        _termsAndConditions.close();
        _generalValidation.close();
        _successRegister.close();
        _isLoading.close();
      };
}
