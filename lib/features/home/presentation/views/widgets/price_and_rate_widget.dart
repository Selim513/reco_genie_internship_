import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_star_rate.dart';

class PriceAndRateWidget extends StatelessWidget {
  const PriceAndRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\$18.99',
          style: AppFonts.blackBol25.copyWith(
            color: Colors.blue,
            fontSize: 20.sp,
          ),
        ),
        Row(
          children: [
            StarRating(),
            Text(
              '(4.8)',
              style: AppFonts.boldWhite16.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
