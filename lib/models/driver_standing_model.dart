// To parse this JSON data, do
//
//     final driverStandingModel = driverStandingModelFromMap(jsonString);

import 'dart:convert';

class DriverStandingModel {
  DriverStandingModel({
    required this.mrData,
  });

  MrData mrData;

  factory DriverStandingModel.fromJson(String str) =>
      DriverStandingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DriverStandingModel.fromMap(Map<String, dynamic> json) =>
      DriverStandingModel(
        mrData: MrData.fromMap(json["MRData"]),
      );

  Map<String, dynamic> toMap() => {
        "MRData": mrData.toMap(),
      };
}

class MrData {
  MrData({
    required this.xmlns,
    required this.series,
    required this.url,
    required this.limit,
    required this.offset,
    required this.total,
    required this.standingsTable,
  });

  String xmlns;
  String series;
  String url;
  String limit;
  String offset;
  String total;
  StandingsTable standingsTable;

  factory MrData.fromJson(String str) => MrData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MrData.fromMap(Map<String, dynamic> json) => MrData(
        xmlns: json["xmlns"],
        series: json["series"],
        url: json["url"],
        limit: json["limit"],
        offset: json["offset"],
        total: json["total"],
        standingsTable: StandingsTable.fromMap(json["StandingsTable"]),
      );

  Map<String, dynamic> toMap() => {
        "xmlns": xmlns,
        "series": series,
        "url": url,
        "limit": limit,
        "offset": offset,
        "total": total,
        "StandingsTable": standingsTable.toMap(),
      };
}

class StandingsTable {
  StandingsTable({
    required this.season,
    required this.standingsLists,
  });

  String season;
  List<StandingsList> standingsLists;

  factory StandingsTable.fromJson(String str) =>
      StandingsTable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StandingsTable.fromMap(Map<String, dynamic> json) => StandingsTable(
        season: json["season"],
        standingsLists: List<StandingsList>.from(
            json["StandingsLists"].map((x) => StandingsList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "season": season,
        "StandingsLists":
            List<dynamic>.from(standingsLists.map((x) => x.toMap())),
      };
}

class StandingsList {
  StandingsList({
    required this.season,
    required this.round,
    required this.driverStandings,
  });

  String season;
  String round;
  List<DriverStanding> driverStandings;

  factory StandingsList.fromJson(String str) =>
      StandingsList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StandingsList.fromMap(Map<String, dynamic> json) => StandingsList(
        season: json["season"],
        round: json["round"],
        driverStandings: List<DriverStanding>.from(
            json["DriverStandings"].map((x) => DriverStanding.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "season": season,
        "round": round,
        "DriverStandings":
            List<dynamic>.from(driverStandings.map((x) => x.toMap())),
      };
}

class DriverStanding {
  DriverStanding({
    required this.position,
    required this.positionText,
    required this.points,
    required this.wins,
    required this.driver,
    required this.constructors,
  });

  String position;
  String positionText;
  String points;
  String wins;
  Driver driver;
  List<dynamic> constructors;

  factory DriverStanding.fromJson(String str) =>
      DriverStanding.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DriverStanding.fromMap(Map<String, dynamic> json) => DriverStanding(
        position: json["position"],
        positionText: json["positionText"],
        points: json["points"],
        wins: json["wins"],
        driver: Driver.fromMap(json["Driver"]),
        constructors: List<dynamic>.from(json["Constructors"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "position": position,
        "positionText": positionText,
        "points": points,
        "wins": wins,
        "Driver": driver.toMap(),
        "Constructors": List<dynamic>.from(constructors.map((x) => x)),
      };
}

class Driver {
  Driver({
    required this.driverId,
    required this.permanentNumber,
    required this.code,
    required this.url,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality,
  });

  String driverId;
  String permanentNumber;
  String code;
  String url;
  String givenName;
  String familyName;
  DateTime dateOfBirth;
  String nationality;

  factory Driver.fromJson(String str) => Driver.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Driver.fromMap(Map<String, dynamic> json) => Driver(
        driverId: json["driverId"],
        permanentNumber: json["permanentNumber"],
        code: json["code"],
        url: json["url"],
        givenName: json["givenName"],
        familyName: json["familyName"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        nationality: json["nationality"],
      );

  Map<String, dynamic> toMap() => {
        "driverId": driverId,
        "permanentNumber": permanentNumber,
        "code": code,
        "url": url,
        "givenName": givenName,
        "familyName": familyName,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "nationality": nationality,
      };
}
