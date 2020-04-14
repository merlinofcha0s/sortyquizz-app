import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(enumValues: [PackType.values])
enum PackType { FREE, PREMIUM }
