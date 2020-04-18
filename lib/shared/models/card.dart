import 'package:SortyQuizz/shared/models/sorting_type.dart';
import 'package:SortyQuizz/shared/models/value_type.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Card {
  @JsonProperty(name: 'id')
  int id;

  @JsonProperty(name: 'display')
  String display;

  @JsonProperty(name: 'valueToSort')
  String valueToSort;

  @JsonProperty(name: 'valueType', enumValues: ValueType.values)
  ValueType valueType;

  @JsonProperty(name: 'pictureContentType')
  String pictureContentType;

  @JsonProperty(name: 'sortingType', enumValues: SortingType.values)
  SortingType sortingType;

  @JsonProperty(name: 'order')
  int order;

  @JsonProperty(name: 'packId')
  int packId;

  @JsonProperty(name: 'packName')
  String packName;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Card && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Card{id: $id, display: $display, valueToSort: $valueToSort, pictureContentType: $pictureContentType, order: $order, packId: $packId, packName: $packName}';
  }
}
