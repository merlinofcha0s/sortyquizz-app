import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/main/openpack/quizz/quizz_arguments.dart';
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
    final QuizzArgument args = ModalRoute.of(context).settings.arguments;
    final quizzBloc = BlocProvider.of<QuizzBloc>(context);
    quizzBloc.getPackByIdByUser(args.userPackId);
    return StreamBuilder<Pack>(
      stream: quizzBloc.startQuizzStream,
      builder: (context, snapshot) {
        return Scaffold(
          body: Visibility(
            visible: snapshot.hasData,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Text(snapshot.data.name, style: TextStyle(fontSize: 20),),
                    Text(snapshot.data.themeName + ' - lvl' + snapshot.data.level.toString()),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: Divider(thickness: 2,)),
                    Text('Question 1', style: TextStyle(fontSize: 35),)
                  ],
                ),
              ),
            ),
            replacement: LoadingIndicator(),
          ),
        );
      }
    );
  }
}
