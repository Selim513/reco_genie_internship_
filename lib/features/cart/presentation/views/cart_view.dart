import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';
import 'package:reco_genie_internship/core/widgets/custom_elevated_button.dart';
import 'package:reco_genie_internship/core/widgets/custom_menu_appbar.dart';
import 'package:reco_genie_internship/core/widgets/menu_items_container.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomPrimaryAppBar(title: 'My cart'),

      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            MenuItemsContainer(
              widget: Column(
                spacing: 10.h,
                children: [
                  Row(
                    children: [
                      Text('Subtotal', style: AppFonts.blackBol25),
                      Spacer(),
                      Text(
                        '\$780.19',
                        style: AppFonts.blackBol25.copyWith(
                          fontSize: 28,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    spacing: 5.w,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.check_circle_outline, color: Colors.green),
                      Expanded(
                        child: Text(
                          'Part of your order qualifies for FREE Delivery.',
                          maxLines: 2,
                          style: AppFonts.boldWhite16.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        'Choose this option at checkout. ',
                        style: AppFonts.semiBoldGrey32.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'See details',
                        style: AppFonts.boldWhite16.copyWith(
                          fontSize: 14.sp,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  CustomElevatedButton(
                    onPress: () {},
                    widget: Text(
                      'Proceed to checkout (4 items)',
                      style: AppFonts.blackBol25.copyWith(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
