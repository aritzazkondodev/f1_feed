import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:f1_feed/theme/theme.dart';
import 'package:f1_feed/providers/providers.dart';

class CampeonatoToggleButtons extends StatelessWidget {
  const CampeonatoToggleButtons({super.key, required this.toggleIndex});

  final String toggleIndex;

  @override
  Widget build(BuildContext context) {
    final toggleButtonProvider = Provider.of<ToggleButtonProvider>(context);
    final selectedOption = toggleIndex == 'home'
        ? toggleButtonProvider.selectedHomeOption
        : toggleButtonProvider.selectedDetailOption;

    return ToggleButtons(
      onPressed: (index) => {
        if (toggleIndex == 'home')
          {toggleButtonProvider.selectedHomeToggleOption = index}
        else
          {toggleButtonProvider.selectedDetailToggleOption = index}
      },
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      constraints: const BoxConstraints(
        minHeight: 40,
        minWidth: 140,
      ),
      selectedBorderColor: AppColors.mainColor,
      selectedColor: AppColors.white,
      fillColor: AppColors.mainColor,
      isSelected: selectedOption,
      children: toggleButtonProvider.options,
    );
  }
}
