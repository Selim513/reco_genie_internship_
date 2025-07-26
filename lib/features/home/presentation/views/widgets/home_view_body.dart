import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_menu_banner.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/menu_items_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchBar(),
          CustomMenuBanner(),

          Text('Menu item', style: AppFonts.blackBol25),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Gap(15.h),
              itemCount: 8,
              itemBuilder: (context, index) => MenuItemsContainer(),
            ),
          ),
        ],
      ),
    );
  }
}
