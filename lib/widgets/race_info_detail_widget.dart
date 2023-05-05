import 'package:flutter/material.dart';

import 'package:f1_feed/theme/theme.dart';

class RaceInfoDetail extends StatelessWidget {
  const RaceInfoDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Volver'),
        backgroundColor: AppColors.darkBlack,
        elevation: 0,
      ),
      body: const Center(
        child: Text('pues cosas super importantes'),
      ),
    );
  }
}
