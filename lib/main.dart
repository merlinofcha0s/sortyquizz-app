import 'package:SortyQuizz/environement.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'main.reflectable.dart';
import 'mapper.dart';

void main() {
  initializeReflectable();
  configMapper();
  Constants.setEnvironment(Environment.DEV);
  runApp(SortyQuizzApp());
}
