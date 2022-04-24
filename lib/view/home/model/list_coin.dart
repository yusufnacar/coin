import 'package:coin/core/base/model/base_model.dart';
import 'package:coin/view/home/model/coin_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_coin.g.dart';

@JsonSerializable()
class ListCoin implements BaseModel<ListCoin> {
  @JsonKey(name: "List_Data")
  final List<CoinModel> listData;

  ListCoin(this.listData);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ListCoinFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ListCoinToJson(this);
  }

  factory ListCoin.fromJson(Map<String, dynamic> json) {
    return _$ListCoinFromJson(json);
  }
}
