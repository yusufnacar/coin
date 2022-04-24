import 'dart:convert';

import 'package:coin/view/home/model/list_coin.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/enums/http_enum.dart';
import '../../../core/init/network/i_core_dio.dart';

abstract class IHomeService {
  final String? loadString;

  IHomeService(this.loadString);

  Future<ListCoin?> getCoins();
}

class HomeService extends IHomeService {
  HomeService(String? loadString) : super(loadString);

  @override
  Future<ListCoin> getCoins() async {
    var data = json.decode(loadString!);

    final response = ListCoin.fromJson(data);

    return response;

    try {} catch (e) {
      print(e);
    }
  }
}
