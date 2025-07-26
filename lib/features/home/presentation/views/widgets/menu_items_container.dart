import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_item_image.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/items_details.dart';

class MenuItemsContainer extends StatelessWidget {
  const MenuItemsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          Expanded(child: CustomItemImage()),

          Expanded(flex: 2, child: ItemDetails()),
        ],
      ),
    );
  }
}
