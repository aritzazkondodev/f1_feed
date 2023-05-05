import 'package:f1_feed/models/season_schedule_model.dart';
import 'package:f1_feed/shared/utils.dart';
import 'package:flutter/material.dart';

import 'package:f1_feed/widgets/widgets.dart';

import '../theme/theme.dart';

class RaceBasicInfo extends StatelessWidget {
  const RaceBasicInfo({super.key, required this.race});

  final Race race;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final date = race.date.toString().substring(0, 10);
    final time = race.time;
    final formattedDate = Utils.convertDateTime(date, time);

    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Theme.of(context).colorScheme.surfaceVariant,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.red.withAlpha(30),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RaceInfoDetail(),
            ));
          },
          child: SizedBox(
            width: width,
            height: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/flags/${race.circuit.circuitId}.png',
                      height: 100,
                      width: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20),
                  // const Spacer(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),

                        if (race.sprint != null) ...[
                          Text(
                            '${race.circuit.location.country}, ${race.circuit.location.locality}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "SPRINT\n",
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ] else ...[
                          Text(
                            '${race.circuit.location.country}, ${race.circuit.location.locality}\n',
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        // Text(
                        //   race.circuit.location.country,
                        //   maxLines: 2,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                        // Text('${race.circuit.location.locality}\n'),
                        Text('Round ${race.round}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
