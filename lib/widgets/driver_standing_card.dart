import 'package:f1_feed/models/driver_standing_model.dart';
import 'package:f1_feed/theme/theme.dart';
import 'package:flutter/material.dart';

class DriverStandingCard extends StatelessWidget {
  const DriverStandingCard(
      {super.key, required this.driver, required this.isLast});

  final DriverStanding driver;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    const double boxDistance = 6;

    final Map<String, Color> constructorColors = AppColors().toJson();
    final a = driver.constructors[0]
        .toString()
        .substring(1, driver.constructors[0].toString().length - 1)
        .split(',');
    final b = a[0].split(':');
    final c = b[1].trim();

    final color = constructorColors.entries
        .firstWhere((element) => element.key == c)
        .value;

    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : boxDistance),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                color: color,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                  child: Row(
                    children: [
                      // Image.asset(
                      //   'assets/images/${constructor.constructor.constructorId}.png',
                      //   height: 50,
                      //   width: 50,
                      //   fit: BoxFit.contain,
                      // ),
                      Stack(
                        children: [
                          Text(
                            '${driver.positionText}.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = AppColors.darkBlack,
                            ),
                          ),
                          Text(
                            '${driver.positionText}.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textWhite,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Stack(
                        children: [
                          Text(
                            '${driver.driver.givenName} ${driver.driver.familyName}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = AppColors.darkBlack,
                            ),
                          ),
                          Text(
                            '${driver.driver.givenName} ${driver.driver.familyName}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: boxDistance),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              width: 90,
              color: AppColors.softBlack,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Text(
                          '${driver.points} pts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = AppColors.darkBlack,
                          ),
                        ),
                        Text(
                          '${driver.points} pts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding:
              const EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Text(
                      '${driver.positionText}.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = AppColors.darkBlack,
                      ),
                    ),
                    Text(
                      '${driver.positionText}.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                Stack(
                  children: [
                    Text(
                      '${driver.driver.givenName} ${driver.driver.familyName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = AppColors.darkBlack,
                      ),
                    ),
                    Text(
                      '${driver.driver.givenName} ${driver.driver.familyName}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Stack(
                  children: [
                    Text(
                      '${driver.points} pts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = AppColors.darkBlack,
                      ),
                    ),
                    Text(
                      '${driver.points} pts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
