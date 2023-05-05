import 'package:f1_feed/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:f1_feed/services/services.dart';
import 'package:f1_feed/providers/providers.dart';
import 'package:f1_feed/widgets/widgets.dart';

class CampeonatoBasic extends StatelessWidget {
  const CampeonatoBasic({super.key});

  @override
  Widget build(BuildContext context) {
    final standingService = Provider.of<StandingService>(context);
    final toggleButtonProvider = Provider.of<ToggleButtonProvider>(context);
    final selectedOption = toggleButtonProvider.selectedHomeOption;

    return selectedOption[0] == true
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: standingService.drivers.length,
            itemBuilder: (context, index) {
              return DriverStandingCard(
                driver: standingService.drivers[index],
                isLast: (index + 1) == standingService.drivers.length,
              );
            },
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: standingService.constructors.length,
            // itemCount: 1,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => TeamDetailScreen(
                            constructor: standingService.constructors[index])),
                  );
                },
                child: ConstructorStandingCard(
                  constructor: standingService.constructors[index],
                  isLast: (index + 1) == standingService.constructors.length,
                ),
              );
            },
          );
  }
}
