import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/main/openpack/quizz/quizz_arguments.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:SortyQuizz/shared/containers/loading_indicator_widget.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'open_pack_bloc.dart';

class OpenPackScreen extends StatelessWidget {
  OpenPackScreen({Key key}) : super(key: QuizzKeys.openPackScreen);

  @override
  Widget build(BuildContext context) {
    final openPackBloc = BlocProvider.of<OpenPackBloc>(context);
    openPackBloc.getAllPackForConnectedUser();
    return StreamBuilder<List<UserPack>>(
        stream: openPackBloc.openPackStream,
        builder: (context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  title: Text(S.of(context).pageOpenPackAppBar)),
              backgroundColor: Colors.grey,
              body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      children: <Widget>[
                        head(context),
                        Padding(padding: EdgeInsets.only(bottom: 30.0),),
                        packList(snapshot.data, context),
                        Padding(padding: EdgeInsets.only(bottom: 30.0),),
                        buyPack(context)
                      ],
                    )),
              ));
        });
  }

  Widget head(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          S.of(context).pageOpenPackMyPacks,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          S.of(context).pageOpenPackFilter,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget packList(List<UserPack> packs, BuildContext context) {
    if (packs == null) {
      return LoadingIndicator();
    } else {
      return Wrap(
        spacing: 6.0, // gap between adjacent chips
        runSpacing: 6.0, // gap between lines
        children: <Widget>[for (UserPack pack in packs) packCard(pack, context)],
      );
    }
  }

  Widget packCard(UserPack userPack, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, QuizzRoutes.quizz, arguments: QuizzArgument(userPack.id)),
      child: Card(
        color: Colors.white,
        child: Container(
          height: 160,
          width: 110,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  userPack.themeName,
                  textAlign: TextAlign.center,
                ),
                Text(
                  userPack.packName,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  S.of(context).pageOpenPackLevel + ' ' + userPack.packLevel,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  userPack.lifeLeft.toString() + ' ' + S.of(context).pageOpenPackLife,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buyPack(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Center(
            child: Text(
              S.of(context).pageOpenPackBuyPack,
              style: TextStyle(fontSize: 17),
            ),
          )),
      onPressed: () => () => Navigator.pushNamed(context, QuizzRoutes.register),
    );
  }
}
