import 'dart:convert';

import '../model/list_coin.dart';

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
  }
}
