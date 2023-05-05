import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:f1_feed/models/driver_standing_model.dart';
import 'package:f1_feed/models/constructor_standing_model.dart';

class StandingService extends ChangeNotifier {
  final String _baseUrl = 'ergast.com';

  List<ConstructorStanding> constructors = [];
  List<DriverStanding> drivers = [];

  bool isLoading = true;

  StandingService() {
    getConstructors();
    getDrivers();
  }

  getConstructors() async {
    final response =
        await _getJsonData('api/f1/2023/constructorStandings.json');

    final constructorResponse =
        ConstructorStandingModel.fromJson(response.body);

    constructors = constructorResponse
        .mrData.standingsTable.standingsLists[0].constructorStandings;
    notifyListeners();
  }

  getDrivers() async {
    final response = await _getJsonData('api/f1/2023/driverStandings.json');

    final driverResponse = DriverStandingModel.fromJson(response.body);

    drivers =
        driverResponse.mrData.standingsTable.standingsLists[0].driverStandings;
    notifyListeners();
  }

  Future<http.Response> _getJsonData(String endpoint) async {
    final url = Uri.https(_baseUrl, endpoint);
    final response = await http.get(url);
    return response;
  }
}
