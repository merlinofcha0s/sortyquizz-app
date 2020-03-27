import 'package:flutter/widgets.dart';

enum Environment { DEV, PROD }

class Constants {
  static Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get api {
    return _config[_Config.API];
  }
}

class _Config {
  static const API = "SERVER_ONE";

  static Map<String, dynamic> debugConstants = {
    API: "http://localhost:8080/",
  };

  static Map<String, dynamic> prodConstants = {
    API: "https://itsallwidgets.com/",
  };
}
