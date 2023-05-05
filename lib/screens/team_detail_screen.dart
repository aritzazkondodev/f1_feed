import 'package:flutter/material.dart';

import 'package:f1_feed/models/models.dart';
import 'package:f1_feed/theme/theme.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({Key? key, required this.constructor})
      : super(key: key);

  final ConstructorStanding constructor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Volver'),
        backgroundColor: AppColors.darkBlack,
        elevation: 0,
      ),
      body: Center(
        child: Text(constructor.constructor.name),
      ),
    );
  }
}
