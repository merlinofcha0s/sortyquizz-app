import 'package:flutter/foundation.dart';

@immutable
class Question {
  final String id;
  final String question;
  final int level;

  Question(this.id, this.question, this.level);

  Question copyWith(String id, String question, int level) {
    return  Question(
      id ?? this.id,
      question??  this.question,
      level??  this.level
    );
  }

  @override
  int get hashCode =>
      question.hashCode ^ level.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Question &&
              runtimeType == other.runtimeType &&
              question == other.question &&
              level == other.level &&
              id == other.id;

  @override
  String toString() {
    return 'Question{question: $question, level: $level, id: $id}';
  }
}
