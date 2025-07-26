import 'package:flutter/material.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/custom_menu_appBar.dart';
import 'package:reco_genie_internship/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CusotmMenuAppBar(), body: HomeViewBody());
  }
}
