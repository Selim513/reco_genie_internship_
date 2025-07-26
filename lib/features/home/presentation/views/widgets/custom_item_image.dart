import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemImage extends StatelessWidget {
  const CustomItemImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),

        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl)
          // AssetImage('assets/burger.jpg'),
        ),
      ),
    );
  }
}
