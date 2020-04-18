import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(enumValues: PackState.values)
enum PackState { OPEN, COMPLETED, RECYCLED }