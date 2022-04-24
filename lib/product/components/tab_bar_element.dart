import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../view/home/model/coin_model.dart';
import '../../view/home/view_model/home_view_model.dart';
import 'coin_list_tile.dart';

class TabBarElement extends StatelessWidget {
  final bool isSpot;
  final bool isAll;
  final HomeViewModel? viewModel;
  final List<CoinModel>? coin;
  const TabBarElement(
      {Key? key,
      required this.isSpot,
      required this.isAll,
      this.viewModel,
      this.coin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: coin?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CoinListTile(
                  volume: coin?[index].volume.toString(),
                  lastPrice: coin?[index].lastPrice.toString(),
                  symbol: isAll
                      ? "${viewModel?.coins[index].base}/${viewModel?.symbolType(index)}"
                      : isSpot
                          ? "${coin?[index].base}/${coin?[index].quote}"
                          : "${coin?[index].base}/PERP"),
              Divider(
                color: Colors.black,
                height: 1,
              )
            ],
          );
        },
      );
    });
  }
}
