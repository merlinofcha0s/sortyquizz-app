import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/main/finishstep1/finish_step1_arguments.dart';
import 'package:SortyQuizz/main/quizz/quizz_arguments.dart';
import 'package:SortyQuizz/quizz/model/answer.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:SortyQuizz/shared/containers/loading_indicator_widget.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:flutter/material.dart';

import 'quizz_bloc.dart';

class QuizzScreen extends StatelessWidget {
  QuizzScreen({Key key}) : super(key: QuizzKeys.quizzScreen);

  @override
  Widget build(BuildContext context) {
    final QuizzArgument args = ModalRoute.of(context).settings.arguments;
    final quizzBloc = BlocProvider.of<QuizzBloc>(context);
    quizzBloc.getUserPackByIdByUser(args.userPackId);
    return StreamBuilder<UserPack>(
        stream: quizzBloc.startQuizzStream,
        builder: (context, snapshot) {
          return WillPopScope(
            onWillPop: onBack,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white70,
                body: body(context, snapshot.data, quizzBloc),
                bottomNavigationBar: bottom(snapshot.data, quizzBloc, context),
              ),
            ),
          );
        });
  }

  Future<bool> onBack() async {
    return false;
  }

  Widget body(BuildContext context, UserPack userPack, QuizzBloc quizzBloc) {
    return StreamBuilder<Question>(
        stream: quizzBloc.nextQuestionStream,
        builder: (context, snapshotQuestion) {
          if (snapshotQuestion.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  questionBloc(context, userPack, snapshotQuestion.data, quizzBloc),
                  Padding(padding: EdgeInsets.only(top: 20),),
                  answersBloc(quizzBloc, context)
                ],
              ),
            );
          } else {
            return LoadingIndicator();
          }
        });
  }

  Widget questionBloc(BuildContext context, UserPack userPack, Question question, QuizzBloc quizzBloc) {
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
                  userPack.pack.name,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(userPack.themeName + ' - ' + S.of(context).pageQuizzStep1Lvl + userPack.pack.level.toString()),
                Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: Divider(
                      thickness: 1,
                    )),
                StreamBuilder<int>(
                  stream: quizzBloc.updateQuestionNumberStream,
                  builder: (context, snapshot) {
                    return Text(
                      S.of(context).pageQuizzStep1QuestionTitle + snapshot.data.toString(),
                      style: TextStyle(fontSize: 28),
                    );
                  }
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Text(question.question, style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(top: 20),),
                Text(S.of(context).pageQuizzStep1QuestionTimer, style: TextStyle(fontSize: 17), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(top: 5),),
                StreamBuilder<int>(
                  stream: quizzBloc.timerStream,
                  builder: (context, snapshot) {
                    int timer = snapshot.hasData ? snapshot.data : userPack.pack.rule.timePerQuestion;
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

  Widget answersBloc(QuizzBloc quizzBloc, BuildContext context) {
    return StreamBuilder<List<Answer>>(
      stream: quizzBloc.answersStream,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Wrap(
            runSpacing: 8,
            spacing: 8,
            children: <Widget>[
              for (Answer answer in snapshot.data) answerCard(answer, quizzBloc, context)
            ],
          );
        } else {
          return LoadingIndicator();
        }
      }
    );
  }

  Widget answerCard(Answer answer, QuizzBloc quizzBloc, BuildContext context) {
    return GestureDetector(
      onTap: () => onChooseAnswer(quizzBloc, answer, context),
      child: Container(
        width: 160,
        height: 120,
        child: Card(
          color: displayRightOrWrongAnswer(answer),
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

  Color displayRightOrWrongAnswer(Answer answer){
    if(answer.hasBeenChoose && answer.isTheRightAnswer){
      return Colors.green;
    } else if (answer.hasBeenChoose && !answer.isTheRightAnswer){
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  onChooseAnswer(QuizzBloc quizzBloc, Answer answer, BuildContext context) async {
    if(!quizzBloc.lockAnswer) {
      quizzBloc.validateAnswer(answer);
      bool ok = await quizzBloc.waitFor(2);
      if(quizzBloc.hasNextQuestion() && ok) {
        await quizzBloc.getNextQuestion();
      } else {
        FinishStep1Argument finishStep1Arg = await quizzBloc.finishStep1();
        await Navigator.pushNamed(context, QuizzRoutes.finishStep1, arguments: finishStep1Arg);
      }
    }
  }

  Widget bottom(UserPack userpack, QuizzBloc quizzBloc, BuildContext context) {
    if(userpack == null) {
      return LoadingIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12.0, bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<int>(
                stream: quizzBloc.updateWonCardsStream,
                builder: (context, snapshot) {
                  var nbCardWon = snapshot.hasData ? snapshot.data : 0;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(S.of(context).pageQuizzStep1WonCard),
                      Text(nbCardWon.toString() + '/' +
                          userpack.pack.rule.nbMinCardToWin.toString()),
                    ],
                  );
                }
            ),
            StreamBuilder<int>(
                stream: quizzBloc.updateQuestionNumberStream,
                builder: (context, snapshot) {
                  var questionNumber = snapshot.hasData ? snapshot.data : 0;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(S.of(context).pageQuizzStep1CurrentQuestion),
                      Text(questionNumber.toString() + '/' +
                          userpack.pack.rule.nbMaxQuestions.toString()),
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
