import 'package:f1_feed/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:f1_feed/models/constructor_standing_model.dart';

class ConstructorStandingCard extends StatelessWidget {
  const ConstructorStandingCard(
      {super.key, required this.constructor, required this.isLast});

  final ConstructorStanding constructor;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    const double boxDistance = 6;

    final Map<String, Color> constructorColors = AppColors().toJson();
    final color = constructorColors.entries
        .firstWhere(
            (element) => element.key == constructor.constructor.constructorId)
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/constructors/${constructor.constructor.constructorId}.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 15),
                      Stack(
                        children: [
                          Text(
                            constructor.constructor.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = AppColors.darkBlack,
                            ),
                          ),
                          Text(
                            constructor.constructor.name,
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
                          '${constructor.points} pts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = AppColors.darkBlack,
                          ),
                        ),
                        Text(
                          '${constructor.points} pts',
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
                Image.asset(
                  'assets/images/${constructor.constructor.constructorId}.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 5),
                Stack(
                  children: [
                    Text(
                      constructor.constructor.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = AppColors.darkBlack,
                      ),
                    ),
                    Text(
                      constructor.constructor.name,
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
                      '${constructor.points} pts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = AppColors.darkBlack,
                      ),
                    ),
                    Text(
                      '${constructor.points} pts',
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


// const SizedBox(width: 5),
// Stack(
//   children: [
//     Text(
//       '${constructor.positionText}.',
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         foreground: Paint()
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 3
//           ..color = AppColors.darkBlack,
//       ),
//     ),
//     Text(
//       '${constructor.positionText}.',
//       style: TextStyle(
//         fontWeight: FontWeight.w500,
//         color: AppColors.textWhite,
//       ),
//     ),
//   ],
// ),
