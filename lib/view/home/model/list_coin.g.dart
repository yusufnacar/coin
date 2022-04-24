// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCoin _$ListCoinFromJson(Map<String, dynamic> json) => ListCoin(
      (json['List_Data'] as List<dynamic>)
          .map((e) => CoinModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCoinToJson(ListCoin instance) => <String, dynamic>{
      'List_Data': instance.listData,
    };
