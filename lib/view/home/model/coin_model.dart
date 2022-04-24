import 'package:coin/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel implements BaseModel<CoinModel> {
  final String? base;
  final String? quote;
  final String? type;
  final double? lastPrice;
  final double? volume;

  CoinModel(this.base, this.quote, this.type, this.lastPrice, this.volume);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$CoinModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CoinModelToJson(this);
  }

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return _$CoinModelFromJson(json);
  }
}
