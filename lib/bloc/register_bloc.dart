import 'dart:async';

import 'package:SortyQuizz/bloc/bloc.dart';
import 'package:SortyQuizz/mixins/validators_mixin.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc with ValidatorMixin {
  final _login = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _termsAndConditions = BehaviorSubject<bool>();
  final _generalValidation = BehaviorSubject<bool>();

  Stream<String> get loginStream => _login.stream.transform(validateLogin);

  Stream<String> get emailStream => _email.stream.transform(validateEmail);

  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);

  Stream<String> get confirmPasswordStream => _confirmPassword.stream;

  Stream<bool> get termsAndConditionsStream =>
      _termsAndConditions.stream.transform(validateTermsAndCondition);

  Stream<bool> get generalValidationStream => _generalValidation.stream;

  Function(String) get changeLogin => _login.sink.add;

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;

  Function(bool) get changeTermsAndConditions => _termsAndConditions.sink.add;

  Function(bool) get changeGeneralValidation => _generalValidation.sink.add;

  Stream<bool> get submitValid => Rx.combineLatest5(
      loginStream,
      emailStream,
      passwordStream,
      confirmPasswordStream,
      termsAndConditionsStream,
      (l, e, p, cp, tc) => true);

  RegisterBloc() {}

  submit() {
    final String login = _login.value;
    final String email = _email.value;
    final String password = _password.value;
    final String confirmPassword = _confirmPassword.value;

    bool validationOk = true;

    if (password.compareTo(confirmPassword) != 0) {
      validationOk = false;
      _generalValidation.addError('The passwords are not identical');
    } else {
      validationOk = true;
      _generalValidation.add(true);
    }

    if (validationOk) {
      print(
          'The login is $login, The email is $email, the password is $password, Calling API.................');
    }
  }

  @override
  void dispose() => () {
        _login.close();
        _email.close();
        _password.close();
        _confirmPassword.close();
        _termsAndConditions.close();
        _generalValidation.close();
      };
}
