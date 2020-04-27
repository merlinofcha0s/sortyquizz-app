import 'dart:ui';

import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/main/finishstep2/finish_step2_bloc.dart';
import 'package:SortyQuizz/main/quizz/quizz_arguments.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:SortyQuizz/shared/containers/loading_indicator_widget.dart';
import 'package:SortyQuizz/shared/models/result_step1_type.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/widget/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../keys.dart';

class FinishStep2Screen extends StatelessWidget {
  FinishStep2Screen({Key key}) : super(key: QuizzKeys.finishStep2Screen);

  @override
  Widget build(BuildContext context) {
    final UserPack currentPack = ModalRoute.of(context).settings.arguments;
    final finishStep2Bloc = BlocProvider.of<FinishStep2Bloc>(context);
    finishStep2Bloc.loadState(currentPack);
    return StreamBuilder<UserPack>(
      stream: finishStep2Bloc.resultStream,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return WillPopScope(
            onWillPop: () => onBackPressed(),
            child: Scaffold(
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: SortyHeader(snapshot.data)),
              backgroundColor: Colors.white70,
              body: body(context, finishStep2Bloc, snapshot.data),
            ),
          );
        } else {
          return LoadingIndicator();
        }
      }
    );
  }

  Future<bool> onBackPressed() async {
    return false;
  }

  body(BuildContext context, FinishStep2Bloc finishStep2Bloc, UserPack userPack) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              bodyTitle(userPack.resultStep, context),
              Padding(padding: const EdgeInsets.all(5.0),),
              bodySubtitle(userPack.resultStep, context, 1),
              Padding(padding: const EdgeInsets.all(5.0),),
              statsForSuccess(context, userPack),
              nextAction(context, userPack),
              abort(context, finishStep2Bloc, userPack)
            ],
          ),
        ],
      ),
    );
  }

  Widget statsForSuccess(BuildContext context, UserPack userPack){
    return Visibility(
      visible: userPack.resultStep == ResultStep.SUCCEED,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(width: 80, child: Text(S.of(context).pageFinishStep2StepSortTitle)),
              card(context, S.of(context).pageFinishStep2StepSortNumberOfCards, userPack.pack.cards.length.toString()),
              card(context, S.of(context).pageFinishStep2StepSortTime, '${userPack.timeAtSortingStep}s')
            ],
          ),
          Padding(padding: const EdgeInsets.all(5.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(width: 80,child: Text(S.of(context).pageFinishStep2StepQuizzTitle)),
              card(context, S.of(context).pageFinishStep1UsedQuestion, userPack.nbQuestionsToSucceed.toString() + ' / ' + userPack.pack.rule.nbMaxQuestions.toString()),
              card(context, S.of(context).pageFinishStep1UsedTime, userPack.timeAtQuizzStep.toString() + 's')
            ],
          ),
          Padding(padding: const EdgeInsets.all(5.0),),
          Text(S.of(context).pageFinishStep2Rank(1), textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
          Padding(padding: const EdgeInsets.all(5.0),),
          divider(context),
          Padding(padding: const EdgeInsets.all(5.0),),
          xpBlock(context, userPack.resultStep)
        ],
      ),
    );
  }

  Widget xpBlock(BuildContext context, ResultStep resultStep) {
    return Visibility(
      visible: resultStep == ResultStep.SUCCEED,
      child: Column(
        children: <Widget>[
          Text(S.of(context).pageFinishStep2WinXP, style: TextStyle(fontSize: 20)),
          Padding(padding: const EdgeInsets.only(top: 5.0),),
          Text('XX xp + XX PO', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),),
          Padding(padding: const EdgeInsets.only(top: 10.0),),
          RaisedButton(
            color: Colors.white,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 30,
                child: Center(
                    child: Text('Ok', style: TextStyle(fontSize: 17),))),
            onPressed: () => onSuccessPack(context),
          )
        ],
      ),
    );
  }

  Widget divider(BuildContext context){
    return Container(
        width: MediaQuery.of(context).size.width * 0.40,
        child: Divider(
          color: Colors.black,
          thickness: 2,
        ));
  }


  Widget bodyTitle(ResultStep resultStep, BuildContext context) {
    Widget result;
    if(resultStep == ResultStep.SUCCEED) {
      result = Text(S.of(context).pageFinishStep2TitleSuccess, style: TextStyle(fontSize: 30),);
    } else {
      result = Text(S.of(context).pageFinishStep2TitleFail, style: TextStyle(fontSize: 30),);
    }

    return result;
  }

  Widget bodySubtitle(ResultStep resultStep1, BuildContext context, int numberOfLifeUsed) {
    Widget result;
    if(resultStep1 == ResultStep.SUCCEED) {
      result = Column(
        children: <Widget>[
          Text(S.of(context).pageFinishStep2SubTitleSuccess, style: TextStyle(fontSize: 20),),
          Padding(padding: const EdgeInsets.only(top: 8),),
          Text(S.of(context).pageFinishStep2SubTitleLifeUsedSuccess(numberOfLifeUsed), style: TextStyle(fontSize: 15),),
        ],
      );
    } else {
      result = Text(S.of(context).pageFinishStep2SubTitleFail, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,);
    }
    return result;
  }

  Widget card(BuildContext context, String line1, String line2) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(line1, textAlign: TextAlign.center,),
                Text(line2),
              ],),
          )
      ),
    );
  }

  Widget nextAction(BuildContext context, UserPack userPack) {
    if (userPack.resultStep == ResultStep.FAIL_WITH_LIFE) {
      return Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(15.0),),
          buttonForNextAction(S.of(context).pageFinishStep1RestartPackStep1, () => onRestartPack(context, userPack.id), context),
          Padding(padding: const EdgeInsets.all(5.0),),
          Text(S.of(context).pageFinishStep1ActionLifeLeft(userPack.lifeLeft), style: TextStyle(fontSize: 17),)
        ],
      );
    } else if (userPack.resultStep == ResultStep.FAIL_WITHOUT_LIFE) {
      return Column(
        children: <Widget>[
          Text(S.of(context).pageFinishStep1LooseWithoutLife, style: TextStyle(fontSize: 17),),
          Padding(padding: const EdgeInsets.all(5.0),),
          buttonForNextAction(S.of(context).pageFinishStep1ActionLooseWithoutLife, () => Navigator.pushNamed(context, QuizzRoutes.openPack), context)
        ],
      );
    } else {
      return Container();
    }
  }

  onRestartPack(BuildContext context, int userpackId) async {
    Navigator.pushNamed(context, QuizzRoutes.quizz, arguments: QuizzArgument(userpackId));
  }

  Widget buttonForNextAction(String labelBtn, Function onPressed, BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 80,
          child: Center(
              child: Text(labelBtn, style: TextStyle(fontSize: 17),))),
      onPressed: onPressed,
    );
  }

  Widget abort(BuildContext context, FinishStep2Bloc finishStep2Bloc, UserPack userPack) {
    return Visibility(
      visible: userPack.resultStep != ResultStep.SUCCEED,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.white,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 40,
                  child: Center(child: Text(S.of(context).pageFinishStep1AbortPack, style: TextStyle(fontSize: 17),))),
              onPressed: () => onAbort(context, finishStep2Bloc, userPack.id),
            ),
            Padding(padding: EdgeInsets.only(top: 8),),
            Visibility(visible: userPack.resultStep == ResultStep.FAIL_WITH_LIFE, child: Text(S.of(context).pageFinishStep1AbortPackSubtitle, textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }

  onAbort(BuildContext context, FinishStep2Bloc finishStep2Bloc, int userPackId) async {
    await finishStep2Bloc.abortPack(userPackId);
    Navigator.pushNamed(context, QuizzRoutes.openPack);
  }

  onSuccessPack(BuildContext context) {
    Navigator.pushNamed(context, QuizzRoutes.openPack);
  }
}
