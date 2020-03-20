import 'package:SortyQuizz/actions/actions.dart';
import 'package:SortyQuizz/presentations/login_screen.dart';
import 'package:SortyQuizz/presentations/quizz_screen.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'models/app_state.dart';

class SortyQuizzApp extends StatelessWidget {
  final Store<AppState> store;

  const SortyQuizzApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Sorty quizz',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          QuizzRoutes.home: (context) {
            return LoginPage(title: 'Sorty quizz - Login');
          },
          QuizzRoutes.quizz: (context) {
            return QuizzScreen(
                onInit: () {
                  StoreProvider.of<AppState>(context).dispatch(LoadQuestionsAction());
                }
            );
          },
        },
      ),
    );
  }
}
