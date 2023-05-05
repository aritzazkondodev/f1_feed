// To parse this JSON data, do
//
//     final constructorStandingModel = constructorStandingModelFromMap(jsonString);

import 'dart:convert';

class ConstructorStandingModel {
  ConstructorStandingModel({
    required this.mrData,
  });

  MrData mrData;

  factory ConstructorStandingModel.fromJson(String str) =>
      ConstructorStandingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConstructorStandingModel.fromMap(Map<String, dynamic> json) =>
      ConstructorStandingModel(
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
    required this.constructorStandings,
  });

  String season;
  String round;
  List<ConstructorStanding> constructorStandings;

  factory StandingsList.fromJson(String str) =>
      StandingsList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StandingsList.fromMap(Map<String, dynamic> json) => StandingsList(
        season: json["season"],
        round: json["round"],
        constructorStandings: List<ConstructorStanding>.from(
            json["ConstructorStandings"]
                .map((x) => ConstructorStanding.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "season": season,
        "round": round,
        "ConstructorStandings":
            List<dynamic>.from(constructorStandings.map((x) => x.toMap())),
      };
}

class ConstructorStanding {
  ConstructorStanding({
    required this.position,
    required this.positionText,
    required this.points,
    required this.wins,
    required this.constructor,
  });

  String position;
  String positionText;
  String points;
  String wins;
  Constructor constructor;

  factory ConstructorStanding.fromJson(String str) =>
      ConstructorStanding.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConstructorStanding.fromMap(Map<String, dynamic> json) =>
      ConstructorStanding(
        position: json["position"],
        positionText: json["positionText"],
        points: json["points"],
        wins: json["wins"],
        constructor: Constructor.fromMap(json["Constructor"]),
      );

  Map<String, dynamic> toMap() => {
        "position": position,
        "positionText": positionText,
        "points": points,
        "wins": wins,
        "Constructor": constructor.toMap(),
      };
}

class Constructor {
  Constructor({
    required this.constructorId,
    required this.url,
    required this.name,
    required this.nationality,
  });

  String constructorId;
  String url;
  String name;
  String nationality;

  factory Constructor.fromJson(String str) =>
      Constructor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Constructor.fromMap(Map<String, dynamic> json) => Constructor(
        constructorId: json["constructorId"],
        url: json["url"],
        name: json["name"],
        nationality: json["nationality"],
      );

  Map<String, dynamic> toMap() => {
        "constructorId": constructorId,
        "url": url,
        "name": name,
        "nationality": nationality,
      };
}
