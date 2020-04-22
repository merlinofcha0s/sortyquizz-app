import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Answer {

  @JsonProperty(name: 'id')
  int id;

  @JsonProperty(name: 'answer')
  String answer;

  @JsonProperty(name: 'order')
  int order;

  @JsonProperty(name: 'isTheRightAnswer')
  bool isTheRightAnswer;

  @JsonProperty(name: 'questionId')
  int questionId;

  @JsonProperty(name: 'question')
  String question;

  bool hasBeenChoose = false;

  Answer(this.answer, this.order);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Answer && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
