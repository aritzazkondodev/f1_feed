import 'package:f1_feed/models/season_schedule_model.dart';
import 'package:f1_feed/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:f1_feed/services/services.dart';
import 'package:f1_feed/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool nextRaceLoaded = false;
  bool nextRaceLoadingError = false;
  late Race nextRace;

  Future<Race?> getNextRace() async {
    Race? nextRace = await CalendarioService.getNextRace();
    return nextRace;
  }

  @override
  void initState() {
    super.initState();
    getNextRace().then((value) {
      nextRaceLoaded = true;
      if (value != null) {
        nextRace = value;
      } else {
        nextRaceLoadingError = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // final productService = Provider.of<StandingService>(context);
    // final calendarioService = Provider.of<CalendarioService>(context);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PROXIMA CARRERA',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              if (nextRaceLoadingError) {
                return const Text("Connection error");
              } else if (nextRaceLoaded) {
                return RaceBasicInfo(race: nextRace);
              }

              return Center(
                child: SizedBox(
                  height: 140,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Text(
            'CAMPEONATO',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CampeonatoToggleButtons(
                toggleIndex: 'home',
              ),
            ],
          ),
          const SizedBox(height: 10),
          const CampeonatoBasic()
        ],
      ),
    );
  }
}



// FutureBuilder(
//             future: CalendarioService.getNextRace(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return RaceBasicInfo(race: snapshot.data!);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               return Center(
//                 child: SizedBox(
//                   height: 150,
//                   child: Center(
//                     child: CircularProgressIndicator(
//                       strokeWidth: 5,
//                       color: AppColors.mainColor,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
