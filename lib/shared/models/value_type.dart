import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(enumValues: [ValueType.values])
enum ValueType { DATE, NUMBER, STRING }
