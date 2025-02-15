import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/main/quizz/quizz_arguments.dart';
import 'package:SortyQuizz/routes.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:SortyQuizz/shared/containers/loading_indicator_widget.dart';
import 'package:SortyQuizz/shared/models/pack_state.dart';
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
          return WillPopScope(
            onWillPop: () => onBackPressed(context),
            child: Scaffold(
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
                        ],
                      )),
                )
            , floatingActionButton: buyPack(context),),
          );
        });
  }

  Future<bool> onBackPressed(BuildContext context) async {
    await Navigator.pushNamed(context, QuizzRoutes.main);
    return false;
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
      onTap: () => onTapCard(userPack, context),
      child: Card(
        color: computePackColor(userPack),
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

  Color computePackColor(UserPack userPack){
    if(userPack.state == PackState.COMPLETED){
      return Colors.green;
    } else if (userPack.lifeLeft > 0){
      return Colors.white;
    } else {
      return Colors.red;
    }
  }

  onTapCard(UserPack userPack, BuildContext context) {
    if(userPack.lifeLeft > 0){
      Navigator.pushNamed(context, QuizzRoutes.quizz, arguments: QuizzArgument(userPack.id));
    }
  }

  Widget buyPack(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text(S.of(context).pageOpenPackBuyPack),
      icon: Icon(Icons.add_shopping_cart),
      onPressed: () => () => Navigator.pushNamed(context, QuizzRoutes.register),
    );
  }
}
