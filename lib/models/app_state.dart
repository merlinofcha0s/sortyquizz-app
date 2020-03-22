// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:SortyQuizz/models/question.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<Question> questions;

  AppState({this.questions = const []});

  AppState copyWith({List<Question> questions}) {
    return AppState(
      questions: questions ?? this.questions
    );
  }

  @override
  int get hashCode =>
      questions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          questions == other.questions;

  @override
  String toString() {
    return 'AppState{questions: $questions}';
  }
}
