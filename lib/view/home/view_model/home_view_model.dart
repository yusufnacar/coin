import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/network/network_manager.dart';
import '../../../core/init/notifier/state_provider.dart';
import '../../../product/enum/sort_type_enum.dart';
import '../../../product/helper/throttle_string_helper.dart';
import '../model/coin_model.dart';
import '../model/list_coin.dart';
import '../service/coin_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  late IHomeService homeService;
  late StateProvider stateProvider;

  ObservableList<CoinModel> coins = ObservableList<CoinModel>();
  ObservableList<CoinModel> spotCoins = ObservableList<CoinModel>();
  ObservableList<CoinModel> futuresCoins = ObservableList<CoinModel>();

  ObservableList<CoinModel> reListCoins = ObservableList<CoinModel>();
  ObservableList<CoinModel> spotreListCoins = ObservableList<CoinModel>();
  ObservableList<CoinModel> futuresreListCoins = ObservableList<CoinModel>();
  late ThrottleStringHelper _throttleStringHelper;
  TextEditingController? searchController;

  @override
  void init() async {
    searchController = TextEditingController();
    homeService = HomeService(await NetworkManager.instance!.loadJson());
    _throttleStringHelper = ThrottleStringHelper();
    stateProvider = Provider.of<StateProvider>(context!, listen: false);
    await getData();
  }

  ListCoin? response;

  Future<void> getData() async {
    try {
      stateProvider.changeStatus(ServiceRequestStatus.Loading);
      response = await homeService.getCoins();
      coins.addAll(response!.listData);
      selectAllData();
      selectFutureData();
      selectSpotData();
      stateProvider.changeStatus(ServiceRequestStatus.Success);
    } catch (e) {
      stateProvider.changeStatus(ServiceRequestStatus.Error);
    }
  }

  @observable
  int selectedTabIndex = 0;

  @action
  void selectAllData() {
    coins.sort((a, b) {
      return a.base!.compareTo(b.base!);
    });

    var btc = coins.where((element) => element.base == "BTC").toList();
    var eth = coins.where((element) => element.base == "ETH").toList();
    var woo = coins.where((element) => element.base == "WOO").toList();

    coins.removeWhere((element) => element.base == "BTC");
    coins.removeWhere((element) => element.base == "ETH");
    coins.removeWhere((element) => element.base == "WOO");

    coins.insertAll(0, woo);
    coins.insertAll(0, eth);
    coins.insertAll(0, btc);
    reListCoins.clear();
    reListCoins.addAll(coins);
  }

  @action
  void selectSpotData() {
    var spots = coins.where((e) {
      return e.type == "SPOT";
    }).toList();

    spots.sort((b, a) {
      return a.volume!.compareTo(b.volume!);
    });

    var btc = spots.where((element) => element.base == "BTC").toList();
    var eth = spots.where((element) => element.base == "ETH").toList();
    var woo = spots.where((element) => element.base == "WOO").toList();

    // for (var item in list!) {}
    spots.removeWhere((element) => element.base == "BTC");
    spots.removeWhere((element) => element.base == "ETH");
    spots.removeWhere((element) => element.base == "WOO");

    spots.insertAll(0, woo);
    spots.insertAll(0, eth);
    spots.insertAll(0, btc);

    spotCoins.clear();
    spotCoins.addAll(spots);
    spotreListCoins.clear();
    spotreListCoins.addAll(spotCoins);

    // return spots;
  }

  @action
  void selectFutureData() {
    var future = coins.where((element) => element.type == "FUTURES").toList();
    futuresCoins.clear();
    futuresCoins.addAll(future);
    futuresreListCoins.clear();

    futuresreListCoins.addAll(futuresCoins);
  }

  String? symbolType(int index) {
    if (coins[index].type == "FUTURES") {
      return "PERP";
    } else {
      return coins[index].quote;
    }
  }

  @observable
  bool isSort = false;

  @observable
  SortTableByHeader sortByHeader = SortTableByHeader.isDefault;

  @observable
  IconData? icon;

  @observable
  bool isSortedBySymbol = false;
  @observable
  bool isSortedByLastPrice = false;
  @observable
  bool isSortedByVolume = false;

  @action
  sortByTableHeader(int index, bool result, ObservableList<CoinModel> coin) {
    if (index == 0) {
      isSortedBySymbol = result;
      isSortedByLastPrice = false;
      isSortedByVolume = false;
      sortBySymbol(coin);
    } else if (index == 1) {
      isSortedByLastPrice = result;
      isSortedBySymbol = false;
      isSortedByVolume = false;
      sortByLastPrice(coin);
    } else if (index == 2) {
      isSortedByVolume = result;
      isSortedByLastPrice = false;
      isSortedBySymbol = false;
      sortByVolume(coin);
    }
  }

  @action
  sortBySymbol(ObservableList<CoinModel> coin) {
    coin.sort(
      (a, b) {
        if (sortByHeader == SortTableByHeader.isAscending) {
          return a.base!.compareTo(b.base!);
        } else if (sortByHeader == SortTableByHeader.isDescending) {
          return b.base!.compareTo(a.base!);
        } else {
          return 0;
        }
      },
    );

    if (sortByHeader == SortTableByHeader.isDefault) {
      reLoadDefaultTable();
    }
  }

  @action
  sortByLastPrice(ObservableList<CoinModel> coin) {
    coin.sort(
      (a, b) {
        if (sortByHeader == SortTableByHeader.isAscending) {
          return a.lastPrice!.compareTo(b.lastPrice!);
        } else if (sortByHeader == SortTableByHeader.isDescending) {
          return b.lastPrice!.compareTo(a.lastPrice!);
        } else {
          return 0;
        }
      },
    );

    if (sortByHeader == SortTableByHeader.isDefault) {
      reLoadDefaultTable();
    }
  }

  @action
  sortByVolume(ObservableList<CoinModel> coin) {
    coin.sort(
      (a, b) {
        if (sortByHeader == SortTableByHeader.isAscending) {
          return a.volume!.compareTo(b.volume!);
        } else if (sortByHeader == SortTableByHeader.isDescending) {
          return b.volume!.compareTo(a.volume!);
        } else {
          return 0;
        }
      },
    );

    if (sortByHeader == SortTableByHeader.isDefault) {
      reLoadDefaultTable();
    }
  }

  void reLoadDefaultTable() {
    if (selectedTabIndex == 0) {
      selectAllData();
    } else if (selectedTabIndex == 1) {
      selectSpotData();
    } else {
      selectFutureData();
    }
  }

  @observable
  int? currentIndex;

  @action
  changeTableHeader(int index) {
    if (currentIndex != index) sortByHeader = SortTableByHeader.isDefault;

    ObservableList<CoinModel> coin;

    if (selectedTabIndex == 0) {
      coin = coins;
    } else if (selectedTabIndex == 1) {
      coin = spotCoins;
    } else {
      coin = futuresCoins;
    }

    if (sortByHeader == SortTableByHeader.isDefault) {
      sortByHeader = SortTableByHeader.isAscending;
      icon = Icons.arrow_downward;
      sortByTableHeader(index, true, coin);
      currentIndex = index;
    } else if (sortByHeader == SortTableByHeader.isAscending &&
        currentIndex == index) {
      sortByHeader = SortTableByHeader.isDescending;
      sortByTableHeader(index, true, coin);
      icon = Icons.arrow_upward;
    } else if (sortByHeader == SortTableByHeader.isDescending &&
        currentIndex == index) {
      sortByHeader = SortTableByHeader.isDefault;
      sortByTableHeader(index, false, coin);
    }
  }

  String? _query = '';

  @observable
  List<CoinModel> queryCoin = [];

  void reLoadData(
      ObservableList<CoinModel> coin, ObservableList<CoinModel> reListCoin) {
    coin.clear();
    coin.addAll(reListCoin);
  }

  @action
  fetchAllSearchQuery(
    String text,
  ) {
    _throttleStringHelper.onDelayTouch(text, (text) {
      _query = text;

      ObservableList<CoinModel> coin;
      ObservableList<CoinModel> reListCoin;

      if (selectedTabIndex == 0) {
        coin = coins;
        reListCoin = reListCoins;
      } else if (selectedTabIndex == 1) {
        coin = spotCoins;
        reListCoin = spotreListCoins;
      } else {
        coin = futuresCoins;
        reListCoin = futuresreListCoins;
      }

      if (_query!.isEmpty) {
        reLoadData(coin, reListCoin);
      }

      var queryResult = coin
          .where((element) =>
              element.base!.toLowerCase().contains(_query!.toLowerCase()))
          .toList();
      coin.clear();
      coin.addAll(queryResult);
    });
  }
}

// enum SortTableByHeader { isAscending, isDescending, isDefault }
