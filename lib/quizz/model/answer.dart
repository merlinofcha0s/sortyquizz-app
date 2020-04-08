import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Answer {
  @JsonProperty(name: 'answer')
  String answer;
  @JsonProperty(name: 'order')
  int order;

  Answer(this.answer, this.order);

  Answer copyWith(String answer, int order) {
    return  Answer(
        answer??  this.answer,
        order??  this.order
    );
  }

  @override
  int get hashCode =>
      answer.hashCode ^ answer.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Answer &&
              runtimeType == other.runtimeType &&
              answer == other.answer &&
              order == other.order;

  @override
  String toString() {
    return 'Answer{answer: $answer, order: $order}';
  }
}
