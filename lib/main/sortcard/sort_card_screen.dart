import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/main/sortcard/sort_card_bloc.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:SortyQuizz/shared/containers/loading_indicator_widget.dart';
import 'package:SortyQuizz/shared/models/card.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/widget/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../keys.dart';

class SortCardScreen extends StatelessWidget {
  SortCardScreen({Key key}) : super(key: QuizzKeys.sortCardScreen);

  @override
  Widget build(BuildContext context) {
    final UserPack userPack = ModalRoute.of(context).settings.arguments;
    final sortCardBloc = BlocProvider.of<SortCardBloc>(context);
    sortCardBloc.loadCards(userPack);
    return StreamBuilder<List<CardDTO>>(
        stream: sortCardBloc.cardsStream,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return WillPopScope(
              onWillPop: onBack,
              child: SafeArea(
                child: Scaffold(
                  appBar:  AppBar(
                      automaticallyImplyLeading: false,
                      title: SortyHeader(userPack)),
                  backgroundColor: Colors.white70,
                  body: body(context, snapshot.data, sortCardBloc, userPack),
                ),
              ),
            );
          } else {
            return LoadingIndicator();
          }
        });
  }

  Future<bool> onBack() async {
    return false;
  }

  Widget body(BuildContext context, List<CardDTO> cards, SortCardBloc sortCardBloc, UserPack userPack) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          timerWidget(sortCardBloc, userPack),
          cardsWidget(cards, sortCardBloc),
          Padding(padding: EdgeInsets.only(top: 20),),
          validateWidget(context, sortCardBloc)
        ],
      ),
    );
  }

  Widget timerWidget(SortCardBloc sortCardBloc, UserPack userPack) {
    sortCardBloc.startTimer(userPack);
    return StreamBuilder(
      stream: sortCardBloc.timerStream,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Column(
            children: <Widget>[
              Text(S.of(context).pageSortCardTimer),
              Text(snapshot.data.toString(), style: TextStyle(fontSize: 20),)
            ],
          );
        } else {
          return LoadingIndicator();
        }
      },
    );
  }

  Widget cardsWidget(List<CardDTO> cards, SortCardBloc sortCardBloc) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          CardDTO currentCard = cards[index];
          return DragTarget<CardDTO>(
            onWillAccept: (card) {
              return cards.indexOf(card) != index;
            },
            onAccept: (card) {
              sortCardBloc.changeCardOrder(card, index);
            },
            builder: (BuildContext context, List<CardDTO> candidateData, List<dynamic> rejectedData) {
              return Draggable(
                data: currentCard,
                child: cardWidget(currentCard, TextStyle(fontSize: 15), context),
                childWhenDragging: cardWidget(currentCard, TextStyle(fontWeight: FontWeight.bold), context),
                feedback: cardWidget(currentCard, TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decorationStyle: TextDecorationStyle.solid,
                    decoration: TextDecoration.none), context),
              );
            },
          );
        });
  }

  Widget cardWidget(CardDTO card, TextStyle style, BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 25),
      elevation: 0.6,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          child: Center(child: Text(card.display, textAlign: TextAlign.center, style: style,))
      ),
    );
  }

  Widget validateWidget(BuildContext context, SortCardBloc sortCardBloc) {
    return RaisedButton(
      onPressed: () => validate(sortCardBloc, context),
        color: Colors.blue,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Center(
              child: Text(
                S.of(context).pageSortCardValidate,
                style: TextStyle(fontSize: 15),
              ),
            )));
  }

  validate(SortCardBloc sortCardBloc, BuildContext context) async {
    UserPack userPackRefreshed = await sortCardBloc.validateSorting();
//    Navigator.pushNamed(context, QuizzRoutes.finishStep2, arguments: resultStep);
  }
}
