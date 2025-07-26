import 'package:flutter/material.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_new_item_widget.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/price_and_rate_widget.dart';

class ItemSummaryWidget extends StatelessWidget {
  const ItemSummaryWidget({super.key, required this.price});
  final int price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [PriceAndRateWidget(price: price,), Spacer(), CustomNewItemWidget()],
    );
  }
}
