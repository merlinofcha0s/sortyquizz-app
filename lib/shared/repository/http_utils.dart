import 'dart:convert' show Encoding, utf8;
import 'dart:convert' show json;

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../environement.dart';

class HttpUtils {
  static String errorHeader = 'x-sortyquizzapp-error';
  static String successResult = 'success';
  static String keyForJWTToken = 'jwt-token';

  static String encodeUTF8(String toEncode) {
    return utf8.decode(toEncode.runes.toList());
  }

  static Future<Object> headers() async {
    FlutterSecureStorage storage = new FlutterSecureStorage();
    String jwt = await storage.read(key: HttpUtils.keyForJWTToken);
    if (jwt != null) {
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt'
      };
    } else {
      return {'Accept': 'application/json', 'Content-Type': 'application/json'};
    }
  }

   static dynamic adaptEnumForDeserialization(String body, String keyEnum, String className, bool isList) {
    if(isList){
      List<dynamic> bodyInListMap = json.decode(HttpUtils.encodeUTF8(body));
      for (Map<String, dynamic> item in bodyInListMap) {
        item[keyEnum] = className + '.' + item[keyEnum];
      }
      return json.encode(bodyInListMap);
    } else {
      Map<String, dynamic> bodyInListMap = json.decode(HttpUtils.encodeUTF8(body));
      bodyInListMap[keyEnum] = className + '.' + bodyInListMap[keyEnum];
      return json.encode(bodyInListMap);
    }
  }

  static Future<Response> postRequest<T>(String endpoint, T body) async {
    var headers = await HttpUtils.headers();
    final String json =
        JsonMapper.serialize(body, SerializationOptions(indent: ''));
    return await http.post(Constants.api + endpoint,
        headers: headers, body: json, encoding: Encoding.getByName('utf-8'));
  }

  static Future<Response> getRequest(String endpoint) async {
    var headers = await HttpUtils.headers();
    return await http.get(Constants.api + endpoint, headers: headers);
  }
}
