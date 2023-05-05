import 'dart:io';

import 'package:f1_feed/shared/utils.dart';
import 'package:f1_feed/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:f1_feed/models/season_schedule_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moment_dart/moment_dart.dart';

class CalendarioCard extends StatelessWidget {
  const CalendarioCard({super.key, required this.race});

  final Race race;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final date = race.date.toString().substring(0, 10);
    final time = race.time;
    final formattedDate = Utils.convertDateTime(date, time);

    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/images/flags/${race.circuit.circuitId}.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(formattedDate)
              ],
            ),
          ),
        ),
      ),
    );

    Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Theme.of(context).colorScheme.surfaceVariant,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            splashColor: Colors.red.withAlpha(30),
            onTap: () {
              print('fiuuuuuuuum');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  if (race.circuit.circuitId != 'interlagos') ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/flags/${race.circuit.circuitId}.png',
                        height: 80,
                        width: 120,
                      ),
                    )
                  ] else ...[
                    Text(race.circuit.circuitId)
                  ],
                  const SizedBox(width: 20),
                  Text(formattedDate)
                ],
              ),
            )),
      ),
    );
  }
}
