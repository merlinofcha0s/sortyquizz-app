import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'pack_state.dart';

@jsonSerializable
class UserPack {
  @JsonProperty(name: 'id')
  int id;

  @JsonProperty(name: 'state', enumValues: PackState.values)
  PackState state;

  @JsonProperty(name: 'lifeLeft')
  int lifeLeft;

  @JsonProperty(name: 'nbQuestionsToSucceed')
  int nbQuestionsToSucceed;

  @JsonProperty(name: 'timeAtQuizzStep')
  int timeAtQuizzStep;

  @JsonProperty(name: 'timeAtSortingStep')
  int timeAtSortingStep;

  @JsonProperty(name: 'profileId')
  int profileId;

  @JsonProperty(name: 'packId')
  int packId;

  @JsonProperty(name: 'themeName')
  String themeName;

  @JsonProperty(name: 'packName')
  String packName;

  @JsonProperty(name: 'packLevel')
  String packLevel;

  UserPack(
      this.id,
      this.state,
      this.lifeLeft,
      this.nbQuestionsToSucceed,
      this.timeAtQuizzStep,
      this.timeAtSortingStep,
      this.profileId,
      this.packId,
      this.themeName,
      this.packName,
      this.packLevel);

  @override
  String toString() {
    return 'UserPack{id: $id, state: $state, lifeLeft: $lifeLeft, nbQuestionsToSucceed: $nbQuestionsToSucceed, timeAtQuizzStep: $timeAtQuizzStep, timeAtSortingStep: $timeAtSortingStep, profileId: $profileId, packId: $packId, themeName: $themeName, packName: $packName, packLevel: $packLevel}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPack && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
