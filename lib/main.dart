import 'package:SortyQuizz/reducers/app_state_reducer.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'app.dart';
import 'middleware/store_questions_middleware.dart';
import 'models/app_state.dart';

void main() {
  runApp(
    SortyQuizzApp(
      store: Store<AppState>(appReducer, initialState: AppState(), middleware: createStoreQuizzMiddleware()),
    ),
  );
}
