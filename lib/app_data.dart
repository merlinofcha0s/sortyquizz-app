import 'package:SortyQuizz/models/question.dart';
import 'package:flutter/cupertino.dart';

class AppData with ChangeNotifier {
  List<Question> questions;

  AppData() {
    this.questions = List<Question>();
  }
}
