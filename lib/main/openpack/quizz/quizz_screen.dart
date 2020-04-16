import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/main/openpack/quizz/quizz_arguments.dart';
import 'package:SortyQuizz/quizz/model/answer.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:SortyQuizz/shared/containers/loading_indicator_widget.dart';
import 'package:SortyQuizz/shared/models/pack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'quizz_bloc.dart';

class QuizzScreen extends StatelessWidget {
  QuizzScreen({Key key}) : super(key: QuizzKeys.quizzScreen);

  @override
  Widget build(BuildContext context) {
    final QuizzArgument args = ModalRoute
        .of(context)
        .settings
        .arguments;
    final quizzBloc = BlocProvider.of<QuizzBloc>(context);
    quizzBloc.getPackByIdByUser(args.userPackId);
    return StreamBuilder<Pack>(
        stream: quizzBloc.startQuizzStream,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white70,
            body: body(context, snapshot.data, quizzBloc),
            bottomNavigationBar: bottom(snapshot.data, quizzBloc),
          );
        });
  }

  Widget body(BuildContext context, Pack pack, QuizzBloc quizzBloc) {
    return StreamBuilder<Question>(
        stream: quizzBloc.nextQuestionStream,
        builder: (context, snapshotQuestion) {
          if (snapshotQuestion.hasData) {
            return Column(
              children: <Widget>[
                questionBloc(context, pack, snapshotQuestion.data, quizzBloc),
                Padding(padding: EdgeInsets.only(top: 20),),
                answersBloc(snapshotQuestion.data.answers, quizzBloc)
              ],
            );
          } else {
            return LoadingIndicator();
          }
        });
  }

  Widget questionBloc(BuildContext context, Pack pack, Question question, QuizzBloc quizzBloc) {
    if (question == null) {
      return LoadingIndicator();
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  pack.name,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(pack.themeName + ' - lvl' + pack.level.toString()),
                Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: Divider(
                      thickness: 1,
                    )),
                StreamBuilder<int>(
                  stream: quizzBloc.updateQuestionNumber,
                  builder: (context, snapshot) {
                    return Text(
                      'Question ' + snapshot.data.toString(),
                      style: TextStyle(fontSize: 28),
                    );
                  }
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Text(question.question, style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(top: 20),),
                Text('Timer', style: TextStyle(fontSize: 17), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(top: 5),),
                StreamBuilder<int>(
                  stream: quizzBloc.timer,
                  builder: (context, snapshot) {
                    int timer = snapshot.hasData ? snapshot.data : pack.rule.timePerQuestion;
                    return Text(timer.toString(), style: TextStyle(fontSize: 15), textAlign: TextAlign.center,);
                  }
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget answersBloc(List<Answer> answers, QuizzBloc quizzBloc) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: <Widget>[
        for (Answer answer in answers) answerCard(answer, quizzBloc)
      ],
    );
  }

  Widget answerCard(Answer answer, QuizzBloc quizzBloc) {
    return GestureDetector(
      onTap: () => quizzBloc.chooseAnswer(answer),
      child: Container(
        width: 160,
        height: 120,
        child: Card(
          elevation: 0.6,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text(answer.answer)),
        ),
      ),
    );
  }

  Widget bottom(Pack pack, QuizzBloc quizzBloc) {
    if(pack == null){
      return LoadingIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12.0, bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<int>(
                stream: quizzBloc.updateWonCards,
                builder: (context, snapshot) {
                  var nbCardWon = snapshot.hasData ? snapshot.data : 0;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Cartes gagnées'),
                      Text(nbCardWon.toString() + '/' +
                          pack.rule.nbMinCardToWin.toString()),
                    ],
                  );
                }
            ),
            StreamBuilder<int>(
                stream: quizzBloc.updateQuestionNumber,
                builder: (context, snapshot) {
                  var questionNumber = snapshot.hasData ? snapshot.data : 0;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Questions'),
                      Text(questionNumber.toString() + '/' +
                          pack.rule.nbMaxQuestions.toString()),
                    ],
                  );
                }
            ),
          ],
        ),
      );
    }
  }
}