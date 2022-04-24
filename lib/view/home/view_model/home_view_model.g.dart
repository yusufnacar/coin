// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$selectedTabIndexAtom =
      Atom(name: '_HomeViewModelBase.selectedTabIndex');

  @override
  int get selectedTabIndex {
    _$selectedTabIndexAtom.reportRead();
    return super.selectedTabIndex;
  }

  @override
  set selectedTabIndex(int value) {
    _$selectedTabIndexAtom.reportWrite(value, super.selectedTabIndex, () {
      super.selectedTabIndex = value;
    });
  }

  final _$isSortAtom = Atom(name: '_HomeViewModelBase.isSort');

  @override
  bool get isSort {
    _$isSortAtom.reportRead();
    return super.isSort;
  }

  @override
  set isSort(bool value) {
    _$isSortAtom.reportWrite(value, super.isSort, () {
      super.isSort = value;
    });
  }

  final _$sortByHeaderAtom = Atom(name: '_HomeViewModelBase.sortByHeader');

  @override
  SortTableByHeader get sortByHeader {
    _$sortByHeaderAtom.reportRead();
    return super.sortByHeader;
  }

  @override
  set sortByHeader(SortTableByHeader value) {
    _$sortByHeaderAtom.reportWrite(value, super.sortByHeader, () {
      super.sortByHeader = value;
    });
  }

  final _$iconAtom = Atom(name: '_HomeViewModelBase.icon');

  @override
  IconData? get icon {
    _$iconAtom.reportRead();
    return super.icon;
  }

  @override
  set icon(IconData? value) {
    _$iconAtom.reportWrite(value, super.icon, () {
      super.icon = value;
    });
  }

  final _$isSortedBySymbolAtom =
      Atom(name: '_HomeViewModelBase.isSortedBySymbol');

  @override
  bool get isSortedBySymbol {
    _$isSortedBySymbolAtom.reportRead();
    return super.isSortedBySymbol;
  }

  @override
  set isSortedBySymbol(bool value) {
    _$isSortedBySymbolAtom.reportWrite(value, super.isSortedBySymbol, () {
      super.isSortedBySymbol = value;
    });
  }

  final _$isSortedByLastPriceAtom =
      Atom(name: '_HomeViewModelBase.isSortedByLastPrice');

  @override
  bool get isSortedByLastPrice {
    _$isSortedByLastPriceAtom.reportRead();
    return super.isSortedByLastPrice;
  }

  @override
  set isSortedByLastPrice(bool value) {
    _$isSortedByLastPriceAtom.reportWrite(value, super.isSortedByLastPrice, () {
      super.isSortedByLastPrice = value;
    });
  }

  final _$isSortedByVolumeAtom =
      Atom(name: '_HomeViewModelBase.isSortedByVolume');

  @override
  bool get isSortedByVolume {
    _$isSortedByVolumeAtom.reportRead();
    return super.isSortedByVolume;
  }

  @override
  set isSortedByVolume(bool value) {
    _$isSortedByVolumeAtom.reportWrite(value, super.isSortedByVolume, () {
      super.isSortedByVolume = value;
    });
  }

  final _$currentIndexAtom = Atom(name: '_HomeViewModelBase.currentIndex');

  @override
  int? get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int? value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$queryCoinAtom = Atom(name: '_HomeViewModelBase.queryCoin');

  @override
  List<CoinModel> get queryCoin {
    _$queryCoinAtom.reportRead();
    return super.queryCoin;
  }

  @override
  set queryCoin(List<CoinModel> value) {
    _$queryCoinAtom.reportWrite(value, super.queryCoin, () {
      super.queryCoin = value;
    });
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void selectAllData() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.selectAllData');
    try {
      return super.selectAllData();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSpotData() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.selectSpotData');
    try {
      return super.selectSpotData();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectFutureData() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.selectFutureData');
    try {
      return super.selectFutureData();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sortByTableHeader(
      int index, bool result, ObservableList<CoinModel> coin) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.sortByTableHeader');
    try {
      return super.sortByTableHeader(index, result, coin);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sortBySymbol(ObservableList<CoinModel> coin) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.sortBySymbol');
    try {
      return super.sortBySymbol(coin);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sortByLastPrice(ObservableList<CoinModel> coin) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.sortByLastPrice');
    try {
      return super.sortByLastPrice(coin);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sortByVolume(ObservableList<CoinModel> coin) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.sortByVolume');
    try {
      return super.sortByVolume(coin);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTableHeader(int index) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeTableHeader');
    try {
      return super.changeTableHeader(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchAllSearchQuery(String text) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.fetchAllSearchQuery');
    try {
      return super.fetchAllSearchQuery(text);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTabIndex: ${selectedTabIndex},
isSort: ${isSort},
sortByHeader: ${sortByHeader},
icon: ${icon},
isSortedBySymbol: ${isSortedBySymbol},
isSortedByLastPrice: ${isSortedByLastPrice},
isSortedByVolume: ${isSortedByVolume},
currentIndex: ${currentIndex},
queryCoin: ${queryCoin}
    ''';
  }
}
