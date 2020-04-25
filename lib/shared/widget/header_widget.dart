import 'package:SortyQuizz/generated/l10n.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:flutter/widgets.dart';

class SortyHeader extends StatelessWidget {

  final UserPack userPack;

  SortyHeader(this.userPack);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(userPack.pack.name),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(userPack.pack.themeName),
            Text(' - '),
            Text(S.of(context).pageQuizzStep1Lvl + ' ' + userPack.pack.level.toString()),
          ],
        ),
      ],
    );
  }
}