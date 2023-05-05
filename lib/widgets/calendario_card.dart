import 'dart:io';

import 'package:f1_feed/shared/utils.dart';
import 'package:f1_feed/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:f1_feed/models/season_schedule_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class CalendarioCard extends StatelessWidget {
  const CalendarioCard({super.key, required this.race});

  final Race race;

  @override
  Widget build(BuildContext context) {
    final calendarioService = Provider.of<CalendarioService>(context);
    final bool isNextRace = calendarioService.nextRace[0].round == race.round;

    double width = MediaQuery.of(context).size.width;
    final date = race.date.toString().substring(0, 10);
    final time = race.time;
    final formattedDate = Utils.convertDateTime(date, time);

    return Center(
      child: GestureDetector(
        onTap: () {
          print(race.sprint == null);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(
                  color: !isNextRace
                      ? AppColors.softBlack.withOpacity(0.5)
                      : AppColors.mainColor.withOpacity(0.7)),
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: !isNextRace
                      ? AppColors.softBlack.withOpacity(0.2)
                      : AppColors.mainColor.withOpacity(0.8),
                  spreadRadius: 0.5,
                  blurRadius: 4,
                  offset: const Offset(0.5, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: !isNextRace
                                ? AppColors.softBlack.withOpacity(0.4)
                                : AppColors.mainColor.withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 6,
                            offset: const Offset(
                                5, 0), // changes position of shadow
                          ),
                        ],
                      ),
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
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${race.circuit.location.country}, ${race.circuit.location.locality}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    if (race.sprint != null) ...[
                      Text(
                        "SPRINT",
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ]
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
