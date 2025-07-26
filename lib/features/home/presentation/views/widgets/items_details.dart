import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';
import 'package:reco_genie_internship/features/home/data/models/item_model.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_add_to_cart_button.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/item_summary_widget.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.itemList});
  final ItemModel itemList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          itemList.title,
          maxLines: 2,
          style: AppFonts.blackBol25.copyWith(fontSize: 20.sp),
        ),
        Text(
          itemList.desc,
          maxLines: 2,
          style: AppFonts.regularBoldBlack14.copyWith(
            color: Colors.grey,
            fontSize: 15.sp,
          ),
        ),
        ItemSummaryWidget(price: itemList.price),
        Gap(10.h),
        CustomAddToCartButton(title: 'Add to Cart', onPress: () {}),
      ],
    );
  }
}
