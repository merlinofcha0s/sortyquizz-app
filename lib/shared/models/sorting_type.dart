import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(enumValues: [SortingType.values])
enum SortingType { NATURAL, MANUAL }
