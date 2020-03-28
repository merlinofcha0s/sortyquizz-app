import 'dart:convert' show  utf8;

class HttpUtils {
  static String encodeUTF8(String toEncode) {
    return utf8.decode(toEncode.runes.toList());
  }
}
