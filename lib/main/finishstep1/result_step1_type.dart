
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(enumValues: ResultStep.values)
enum ResultStep { SUCCEED, FAIL_WITH_LIFE, FAIL_WITHOUT_LIFE }
