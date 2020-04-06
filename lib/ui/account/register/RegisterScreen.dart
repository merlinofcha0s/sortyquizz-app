import 'package:SortyQuizz/bloc/bloc_provider.dart';
import 'package:SortyQuizz/bloc/register_bloc.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen() : super(key: QuizzKeys.registerScreen);

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: <Widget>[
            Placeholder(
              color: Colors.blue,
              fallbackHeight: 150,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            successZone(registerBloc),
            StreamBuilder<bool>(
              stream: registerBloc.successRegister,
              builder: (context, snapshot) {
                return Visibility(
                  visible: !snapshot.hasData || !snapshot.data,
                  child: Form(
                    child: Wrap(runSpacing: 15, children: <Widget>[
                      loginField(registerBloc),
                      emailField(registerBloc),
                      passwordField(registerBloc),
                      confirmPasswordField(registerBloc),
                      termsAndConditionsField(registerBloc),
                      validationZone(registerBloc),
                      submit(registerBloc)
                    ]),
                  ),
                );
              }
            )
          ]),
        ));
  }

  Widget loginField(RegisterBloc registerBloc) {
    return StreamBuilder<String>(
        stream: registerBloc.loginStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: registerBloc.changeLogin,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Login',
                  errorText: snapshot.error));
        });
  }

  Widget emailField(RegisterBloc registerBloc) {
    return StreamBuilder<String>(
        stream: registerBloc.emailStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: registerBloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'you@example.com',
                errorText: snapshot.error),
          );
        });
  }

  Widget passwordField(RegisterBloc registerBloc) {
    return StreamBuilder<String>(
        stream: registerBloc.passwordStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: registerBloc.changePassword,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  errorText: snapshot.error));
        });
  }

  Widget confirmPasswordField(RegisterBloc registerBloc) {
    return StreamBuilder<String>(
        stream: registerBloc.confirmPasswordStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: registerBloc.changeConfirmPassword,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm password',
                  errorText: snapshot.error));
        });
  }

  Widget termsAndConditionsField(RegisterBloc registerBloc) {
    return StreamBuilder<bool>(
        stream: registerBloc.termsAndConditionsStream,
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                        onChanged: registerBloc.changeTermsAndConditions,
                        value: snapshot.hasData ? snapshot.data : false),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                  ),
                  Text('I accept the term of use'),
                ],
              ),
              Visibility(
                visible: snapshot.hasError,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Please accept the terms and conditions',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget validationZone(RegisterBloc registerBloc) {
    return StreamBuilder<bool>(
        stream: registerBloc.generalValidationStream,
        builder: (context, snapshot) {
          return Visibility(
              visible: snapshot.hasError,
              child: Center(
                child: Text(
                  snapshot.hasError ? snapshot.error : '',
                  style: TextStyle(color: Colors.red),
                ),
              ));
        });
  }

  Widget submit(RegisterBloc registerBloc) {
    return StreamBuilder(
        stream: registerBloc.submitValid,
        builder: (context, snapshot) {
          return RaisedButton(
            color: Colors.blue,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text('Sign up'))),
            onPressed:
                snapshot.hasData ? registerBloc.submit : null,
          );
        });
  }

  Widget successZone(RegisterBloc registerBloc) {
    return StreamBuilder<bool>(
        stream: registerBloc.successRegister,
        builder: (context, snapshot) {
          return Visibility(
            visible: snapshot.hasData && snapshot.data,
            child: Text('ALRIGHT !!!!!!'),
          );
        });
  }
}
