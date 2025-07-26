import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_add_to_cart_button.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/item_summary_widget.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spicy Arrabiata Pasta',
          maxLines: 2,
          style: AppFonts.blackBol25.copyWith(fontSize: 20.sp),
        ),
        Text(
          'Penne pasta with a fiery tomato sauce, garlic, red chili flakes, and fresh basil.',
          maxLines: 2,
          style: AppFonts.regularBoldBlack14.copyWith(
            color: Colors.grey,
            fontSize: 15.sp,
          ),
        ),
        ItemSummaryWidget(),
        Gap(10.h),
        CustomAddToCartButton(title: 'Add to Cart', onPress: () {}),
      ],
    );
  }
}
