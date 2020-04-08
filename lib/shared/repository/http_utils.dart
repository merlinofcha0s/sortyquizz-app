import 'dart:convert' show Encoding, utf8;

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../environement.dart';


class HttpUtils {
  static String errorHeader = 'x-sortyquizzapp-error';
  static String successResult = 'success';


  static String encodeUTF8(String toEncode) {
    return utf8.decode(toEncode.runes.toList());
  }

  static Object headers() {
    return {"Accept": "application/json", "Content-Type": "application/json"};
  }

  static Future<Response> postRequest<T>(String endpoint, T body) async {
    final String json = JsonMapper.serialize(body, SerializationOptions(indent: ''));
    return await http.post(Constants.api + endpoint,
        headers: HttpUtils.headers(),
        body: json, encoding: Encoding.getByName("utf-8"));
  }
}
