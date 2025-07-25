import 'package:flutter/material.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Home',
          style: AppFonts.semiBoldBlack32.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
