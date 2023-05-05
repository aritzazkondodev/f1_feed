import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:f1_feed/models/season_schedule_model.dart';
import 'package:moment_dart/moment_dart.dart';

class CalendarioService extends ChangeNotifier {
  static const String _baseUrl = 'ergast.com';

  List<Race> races = [];
  List<Race> nextRace = [];

  CalendarioService() {
    getRaces();
  }

  getRaces() async {
    final response = await _getJsonData('api/f1/2023.json');

    final racesResponse = SeasonScheduleModel.fromJson(response.body);

    races = racesResponse.mrData.raceTable.races;

    nextRace = [];
    nextRace.add(racesResponse.mrData.raceTable.races.firstWhere((element) =>
        element.date.isAfter(DateTime.now().add(const Duration(days: 1)))));

    notifyListeners();
  }

  static Future<Race> getNextRace() async {
    final response = await _getJsonData('api/f1/2023.json');

    final racesResponse = SeasonScheduleModel.fromJson(response.body);

    // nextRace = [];

    // nextRace.add(racesResponse.mrData.raceTable.races.firstWhere((element) =>
    //     element.date.isAfter(DateTime.now().add(const Duration(days: 1)))));
    Race next = racesResponse.mrData.raceTable.races.firstWhere((element) =>
        element.date.isAfter(DateTime.now().add(const Duration(days: 1))));
    // notifyListeners();
    return next;
  }

  static Future<http.Response> _getJsonData(String endpoint) async {
    final url = Uri.https(_baseUrl, endpoint);
    final response = await http.get(url);
    return response;
  }
}
