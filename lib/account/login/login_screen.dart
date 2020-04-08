import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';
import 'login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: QuizzKeys.loginScreen);

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).pageLoginTitle),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: <Widget>[
            header(),
            loginForm(loginBloc),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            register(context)
          ]),
        ));
  }

  Widget header() {
    return Column(
      children: <Widget>[
        Placeholder(
          color: Colors.blue,
          fallbackHeight: 150,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 20))
      ],
    );
  }

  Widget loginField(LoginBloc loginBloc) {
    return StreamBuilder<String>(
        stream: loginBloc.loginStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: loginBloc.changeLogin,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: S.of(context).pageRegisterFormLogin,
                  errorText: snapshot.error));
        });
  }

  Widget passwordField(LoginBloc loginBloc) {
    return StreamBuilder<String>(
        stream: loginBloc.passwordStream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: loginBloc.changePassword,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: S.of(context).pageRegisterFormPassword,
                  errorText: snapshot.error));
        });
  }

  Widget loginForm(LoginBloc loginBloc) {
    return StreamBuilder<bool>(
        stream: loginBloc.successRegisterStream,
        builder: (context, snapshot) {
          return Visibility(
            visible: !snapshot.hasData || !snapshot.data,
            child: Form(
              child: Wrap(runSpacing: 15, children: <Widget>[
                loginField(loginBloc),
                passwordField(loginBloc),
                submit(loginBloc)
              ]),
            ),
          );
        });
  }

  Widget register(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
            child: Text(
              S.of(context).pageRegisterTitle.toUpperCase(),
              style: TextStyle(fontSize: 15),
            ),
          )),
      onPressed: () => Navigator.pushNamed(context, QuizzRoutes.register),
    );
  }

  Widget submit(LoginBloc loginBloc) {
    return StreamBuilder(
        stream: loginBloc.submitValid,
        builder: (context, snapshotSubmit) {
          return RaisedButton(
            color: Colors.blue,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: StreamBuilder<bool>(
                    stream: loginBloc.isLoadingStream,
                    builder: (context, snapshotLoading) {
                      return Center(
                        child: Visibility(
                          replacement: CircularProgressIndicator(value: null),
                          visible:
                              snapshotLoading.hasData && !snapshotLoading.data,
                          child: Text(
                            S.of(context).pageLoginLoginButton.toUpperCase(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      );
                    })),
            onPressed: snapshotSubmit.hasData ? loginBloc.authenticate : null,
          );
        });
  }
}
