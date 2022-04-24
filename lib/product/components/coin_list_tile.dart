import 'package:flutter/material.dart';
import 'package:coin/core/extension/context_extension.dart';

class CoinListTile extends StatelessWidget {
  final String? symbol;
  final String? lastPrice;
  final String? volume;
  const CoinListTile({Key? key, this.symbol, this.lastPrice, this.volume})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.075,
      // color: Color(0xFF050A30),
      color: Colors.grey[800],
      child: Padding(
        padding: context.paddingNormal,
        child: Row(
          children: [
            Expanded(
                child: Text(
              symbol ?? "/NA",
              style:
                  context.textTheme.bodyMedium!.copyWith(color: Colors.white),
            )),
            Expanded(
                child: Text("\$$lastPrice",
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: Colors.white))),
            Expanded(
                child: Text("\$$volume",
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
