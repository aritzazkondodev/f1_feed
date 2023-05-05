import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:f1_feed/services/services.dart';
import 'package:f1_feed/widgets/widgets.dart';

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarioService = Provider.of<CalendarioService>(context);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: calendarioService.races.length,
        itemBuilder: (context, index) {
          return CalendarioCard(
            race: calendarioService.races[index],
          );
        },
      ),
    );
  }
}
