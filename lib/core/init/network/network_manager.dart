import 'package:coin/core/constants/app/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'core_dio.dart';
import 'i_core_dio.dart';

abstract class INetworkManager {
  Future<String> loadJson();
}

class NetworkManager implements INetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  // ICoreDio? coreDio;
  String? path;

  NetworkManager._init();

  @override
  Future<String> loadJson() async {
    return await rootBundle.loadString(ApplicationConstants.data);
  }
}
