import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:f1_feed/providers/providers.dart';
import 'package:f1_feed/screens/screens.dart';
import 'package:f1_feed/theme/theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.selectedMenuOpt;

    return SafeArea(
      bottom: true,
      child: Scaffold(
        body: const _HomePageBody(),
        bottomNavigationBar: Container(
          color: AppColors.darkBlack,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: GNav(
                backgroundColor: AppColors.darkBlack,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: AppColors.mainColor,
                padding: const EdgeInsets.all(15),
                gap: 8,
                tabs: const [
                  GButton(
                    icon: Icons.calendar_month_rounded,
                    text: 'Calendario',
                  ),
                  GButton(
                    icon: Icons.emoji_events,
                    text: 'Campeonato',
                  ),
                  GButton(
                    icon: Icons.home,
                    text: 'Inicio',
                  ),
                  GButton(
                    icon: Icons.sports_motorsports,
                    text: 'Pilotos',
                  ),
                  GButton(
                    icon: Icons.directions_car_filled_rounded,
                    text: 'Equipos',
                  ),
                ],
                selectedIndex: currentIndex,
                onTabChange: (index) =>
                    navigationProvider.selectedMenuOpt = index),
          ),
        ),
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const CalendarioScreen();
      case 1:
        return const CampeonatoScreen();
      case 2:
        return const HomeScreen();
      case 3:
        return const PilotosScreen();
      case 4:
        return const EquiposScreen();

      default:
        return const HomeScreen();
    }
  }
}
