import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/main/finishstep1/finish_step1_bloc.dart';
import 'package:SortyQuizz/main/finishstep1/finish_step1_model.dart';
import 'package:SortyQuizz/main/quizz/quizz_arguments.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:SortyQuizz/shared/models/result_step1_type.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/widget/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../keys.dart';

class FinishStep1Screen extends StatelessWidget {
  FinishStep1Screen({Key key}) : super(key: QuizzKeys.finishStep1Screen);

  @override
  Widget build(BuildContext context) {
    final FinishStep1DTO args = ModalRoute.of(context).settings.arguments;
    final finishStep1Bloc = BlocProvider.of<FinishStep1Bloc>(context);
    finishStep1Bloc.loadState(args);
    return StreamBuilder<ResultStep>(
      stream: finishStep1Bloc.resultStream,
      builder: (context, snapshot) {
        return WillPopScope(
          onWillPop: () => onBackPressed(),
          child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: SortyHeader(args.userPack)),
            backgroundColor: Colors.white70,
            body: body(context, args, snapshot.data, finishStep1Bloc),
          ),
        );
      }
    );
  }

  Future<bool> onBackPressed() async {
    return false;
  }

  body(BuildContext context, FinishStep1DTO args, ResultStep resultStep1, FinishStep1Bloc finishStep1Bloc) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          bodyTitle(resultStep1, context),
          Padding(padding: const EdgeInsets.all(15.0),),
          bodySubtitle(resultStep1, context, args.wonCards),
          Padding(padding: const EdgeInsets.all(15.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              card(context, args, S.of(context).pageFinishStep1UsedQuestion, args.usedQuestions.toString() + ' / ' + args.userPack.pack.rule.nbMaxQuestions.toString()),
              card(context, args, S.of(context).pageFinishStep1UsedTime, args.passedTime.toString() + 's')
            ],
          ),
          Padding(padding: const EdgeInsets.all(15.0),),
          nextAction(context, resultStep1, args, finishStep1Bloc, args.userPack),
          abort(context, resultStep1, finishStep1Bloc, args.userPack)
        ],
      ),
    );
  }

  Widget bodyTitle(ResultStep resultStep1, BuildContext context) {
    Widget result;
    if(resultStep1 == ResultStep.SUCCEED) {
      result = Text(S.of(context).pageFinishStep1TitleSucceed, style: TextStyle(fontSize: 30),);
    } else {
      result = Text(S.of(context).pageFinishStep1TitleFail, style: TextStyle(fontSize: 30),);
    }

    return result;
  }

  Widget bodySubtitle(ResultStep resultStep1, BuildContext context, int numberOfWonCards) {
    Widget result;
    if(resultStep1 == ResultStep.SUCCEED) {
      result = Text(S.of(context).pageFinishStep1SubTitleSuccess(numberOfWonCards), style: TextStyle(fontSize: 20),);
    } else {
      result = Text(S.of(context).pageFinishStep1SubTitleFail, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,);
    }
    return result;
  }

  Widget nextAction(BuildContext context, ResultStep resultStep1, FinishStep1DTO args, FinishStep1Bloc finishStep1Bloc, UserPack userpack) {
    if (resultStep1 == ResultStep.SUCCEED) {
      return buttonForNextAction(S.of(context).pageFinishStep1StartStep2,
              () => Navigator.pushNamed(context, QuizzRoutes.sortCard, arguments: userpack), context);
    } else if (resultStep1 == ResultStep.FAIL_WITH_LIFE) {
      return Column(
        children: <Widget>[
          buttonForNextAction(S.of(context).pageFinishStep1RestartPackStep1, () => onRestartPack(context, userpack.id), context),
          Padding(padding: const EdgeInsets.all(5.0),),
          Text(S.of(context).pageFinishStep1ActionLifeLeft(args.userPack.lifeLeft), style: TextStyle(fontSize: 17),)
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Text(S.of(context).pageFinishStep1LooseWithoutLife, style: TextStyle(fontSize: 17),),
          Padding(padding: const EdgeInsets.all(5.0),),
          buttonForNextAction(S.of(context).pageFinishStep1ActionLooseWithoutLife, () => Navigator.pushNamed(context, QuizzRoutes.openPack), context)
        ],
      );
    }
  }

  onRestartPack(BuildContext context, int userpackId) async {
    Navigator.pushNamed(context, QuizzRoutes.quizz, arguments: QuizzArgument(userpackId));
  }

  Widget abort(BuildContext context, ResultStep resultStep1, FinishStep1Bloc finishStep1Bloc, UserPack userPack) {
    return Visibility(
      visible: resultStep1 != ResultStep.SUCCEED,
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
              onPressed: () => onAbort(context, finishStep1Bloc, userPack.id),
            ),
            Padding(padding: EdgeInsets.only(top: 8),),
            Visibility(visible: resultStep1 == ResultStep.FAIL_WITH_LIFE, child: Text(S.of(context).pageFinishStep1AbortPackSubtitle, textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }

  onAbort(BuildContext context, FinishStep1Bloc finishStep1Bloc, int userPackId) async {
    await finishStep1Bloc.abortPack(userPackId);
    Navigator.pushNamed(context, QuizzRoutes.openPack);
  }

  Widget buttonForNextAction(String labelBtn, Function onPressed, BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Center(
              child: Text(labelBtn, style: TextStyle(fontSize: 17),))),
      onPressed: onPressed,
    );
  }

  Widget card(BuildContext context, FinishStep1DTO args, String line1, String line2) {
    return Container(
      width: 100,
      height: 120,
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
}
