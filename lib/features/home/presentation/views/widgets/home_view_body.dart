// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:reco_genie_internship/core/enums/general_bloc_enum.dart';
// import 'package:reco_genie_internship/core/utils/app_fonts.dart';
// import 'package:reco_genie_internship/features/home/data/models/item_model.dart';
// import 'package:reco_genie_internship/features/home/presentation/manger/home_bloc.dart';
// import 'package:reco_genie_internship/features/home/presentation/manger/home_state.dart';
// import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_menu_banner.dart';
// import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_search_bar.dart';
// import 'package:reco_genie_internship/features/home/presentation/views/widgets/menu_items_container.dart';

// class HomeViewBody extends StatelessWidget {
//   const HomeViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
//       child: Column(
//         spacing: 10.h,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomSearchBar(),
//           CustomMenuBanner(),

//           Text('Menu item', style: AppFonts.blackBol25),
//           Expanded(
//             child: BlocBuilder<HomeBloc, HomeBlocState>(
//               builder: (context, state) {
//                 if (state.status == BlocStatus.success) {
//                   List<ItemModel>? itemList = state.itemsList;
//                   return ListView.separated(
//                     separatorBuilder: (context, index) => Gap(15.h),
//                     itemCount: itemList!.length,
//                     itemBuilder: (context, index) =>
//                         MenuItemsContainer(itemList: itemList[index]),
//                   );
//                 } else if (state.status == BlocStatus.fail) {
//                   return Center(child: Text('There is an error'));
//                 } else {
//                   return Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:reco_genie_internship/core/enums/general_bloc_enum.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';
import 'package:reco_genie_internship/features/home/data/models/item_model.dart';
import 'package:reco_genie_internship/features/home/presentation/manger/home_bloc.dart';
import 'package:reco_genie_internship/features/home/presentation/manger/home_state.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_menu_banner.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/menu_item_container_body.dart';
import 'package:reco_genie_internship/core/widgets/menu_items_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Gap(10.h)),
          SliverToBoxAdapter(child: CustomSearchBar()),
          SliverToBoxAdapter(child: Gap(10.h)),

          SliverToBoxAdapter(child: CustomMenuBanner()),
          SliverToBoxAdapter(child: Gap(15.h)),

          SliverToBoxAdapter(
            child: Text('Menu item', style: AppFonts.blackBol25),
          ),
          SliverToBoxAdapter(child: Gap(10.h)),

          BlocBuilder<HomeBloc, HomeBlocState>(
            builder: (context, state) {
              if (state.status == BlocStatus.success) {
                List<ItemModel>? itemList = state.itemsList;
                return SliverList.separated(
                  itemCount: itemList!.length,
                  itemBuilder: (context, index) => MenuItemsContainer(
                    widget: MenuItemContainerBody(itemList: itemList[index]),
                  ),
                  separatorBuilder: (context, index) => Gap(15.h),
                );
              } else if (state.status == BlocStatus.fail) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('There is an error')),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
          SliverToBoxAdapter(child: Gap(20.h)),
        ],
      ),
    );
  }
}
