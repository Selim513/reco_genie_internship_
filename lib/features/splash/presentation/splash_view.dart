import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';
import 'package:reco_genie_internship/core/utils/app_route.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      context.goNamed(AppRouter.registerView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Resturant',
          style: AppFonts.semiBoldBlack32.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
