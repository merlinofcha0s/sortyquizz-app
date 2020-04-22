
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(enumValues: ResultStep1.values)
enum ResultStep1 { SUCCEED, FAIL_WITH_LIFE, FAIL_WITHOUT_LIFE }
