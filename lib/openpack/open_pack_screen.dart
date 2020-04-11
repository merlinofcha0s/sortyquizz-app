import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
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
              body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Column(
                    children: <Widget>[
                      head(),
                      Padding(padding: EdgeInsets.only(bottom: 30.0),),
                      packList(snapshot.data)
                    ],
                  )));
        });
  }

  Widget head() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Mes packs',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Filtre',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget packList(List<UserPack> packs) {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: <Widget>[for (UserPack pack in packs) packCard(pack)],
    );
  }

  Widget packCard(UserPack pack) {
    return Card(
      color: Colors.white,
      child: Container(
        height: 160,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(pack.themeName),
              Text(
                pack.packName,
                style: TextStyle(fontSize: 16),
              ),
              Text(pack.packLevel, style: TextStyle(fontSize: 16)),
              Text(pack.lifeLeft.toString() + ' vie(s)', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
