// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
      json['base'] as String?,
      json['quote'] as String?,
      json['type'] as String?,
      (json['lastPrice'] as num?)?.toDouble(),
      (json['volume'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
      'base': instance.base,
      'quote': instance.quote,
      'type': instance.type,
      'lastPrice': instance.lastPrice,
      'volume': instance.volume,
    };
