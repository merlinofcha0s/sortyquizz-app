import 'package:SortyQuizz/containers/questions_widget.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizzScreen extends StatefulWidget {
  final void Function() onInit;

  QuizzScreen({@required this.onInit}) : super(key: QuizzKeys.quizzScreen);

  @override
  State<StatefulWidget> createState() => QuizzScreenState();
}

class QuizzScreenState extends State<QuizzScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quizz"),
        ),
        body: QuestionsWidget()
    );
  }
}
