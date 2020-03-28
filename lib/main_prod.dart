import 'package:SortyQuizz/environement.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'main_prod.reflectable.dart';
import 'mapper.dart';

void main() {
  initializeReflectable();
  configMapper();
  Constants.setEnvironment(Environment.PROD);
  runApp(SortyQuizzApp());
}
