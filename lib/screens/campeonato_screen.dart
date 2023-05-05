import 'package:flutter/material.dart';

import 'package:f1_feed/widgets/widgets.dart';

class CampeonatoScreen extends StatelessWidget {
  const CampeonatoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CampeonatoToggleButtons(
      toggleIndex: 'detail',
    );
  }
}
