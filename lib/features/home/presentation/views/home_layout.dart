import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:reco_genie_internship/core/utils/service_locator.dart';
import 'package:reco_genie_internship/features/cart/presentation/views/cart_view.dart';
import 'package:reco_genie_internship/features/home/domain/use_case/fetch_menu_item.dart';
import 'package:reco_genie_internship/features/home/presentation/manger/home_bloc.dart';
import 'package:reco_genie_internship/features/home/presentation/manger/home_event.dart';
import 'package:reco_genie_internship/features/home/presentation/views/home_view.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (context) =>
            HomeBloc(getIt.get<FetchMenuItemUseCase>())..add(FetchMenuItem()),
        child: const HomeView(),
      ),
      CartView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.restaurant_menu),
        title: ("Menu"),

        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style3,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
