import 'package:flutter/services.dart';

import '../../constants/app/app_constant.dart';

abstract class INetworkManager {
  Future<String> loadJson();
}

class NetworkManager implements INetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  String? path;

  NetworkManager._init();

  @override
  Future<String> loadJson() async {
    return await rootBundle.loadString(ApplicationConstants.data);
  }
}
