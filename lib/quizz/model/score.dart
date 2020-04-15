import 'package:flutter/widgets.dart';

@immutable
class Result {
  int score;
  int right;
  int wrong;
  int total;

  Result(this.score, this.right, this.wrong, this.total);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result &&
          runtimeType == other.runtimeType &&
          score == other.score &&
          right == other.right &&
          wrong == other.wrong;

  @override
  int get hashCode => score.hashCode ^ right.hashCode ^ wrong.hashCode;

  @override
  String toString() {
    return 'Result{score: $score, right: $right, wrong: $wrong}';
  }
}
