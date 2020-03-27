import 'package:SortyQuizz/environement.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  Constants.setEnvironment(Environment.PROD);
  runApp(SortyQuizzApp());
}
