// To parse this JSON data, do
//
//     final seasonScheduleModel = seasonScheduleModelFromMap(jsonString);

import 'dart:convert';

class SeasonScheduleModel {
  SeasonScheduleModel({
    required this.mrData,
  });

  MrData mrData;

  factory SeasonScheduleModel.fromJson(String str) =>
      SeasonScheduleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeasonScheduleModel.fromMap(Map<String, dynamic> json) =>
      SeasonScheduleModel(
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
    required this.raceTable,
  });

  String xmlns;
  String series;
  String url;
  String limit;
  String offset;
  String total;
  RaceTable raceTable;

  factory MrData.fromJson(String str) => MrData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MrData.fromMap(Map<String, dynamic> json) => MrData(
        xmlns: json["xmlns"],
        series: json["series"],
        url: json["url"],
        limit: json["limit"],
        offset: json["offset"],
        total: json["total"],
        raceTable: RaceTable.fromMap(json["RaceTable"]),
      );

  Map<String, dynamic> toMap() => {
        "xmlns": xmlns,
        "series": series,
        "url": url,
        "limit": limit,
        "offset": offset,
        "total": total,
        "RaceTable": raceTable.toMap(),
      };
}

class RaceTable {
  RaceTable({
    required this.season,
    required this.races,
  });

  String season;
  List<Race> races;

  factory RaceTable.fromJson(String str) => RaceTable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RaceTable.fromMap(Map<String, dynamic> json) => RaceTable(
        season: json["season"],
        races: List<Race>.from(json["Races"].map((x) => Race.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "season": season,
        "Races": List<dynamic>.from(races.map((x) => x.toMap())),
      };
}

class Race {
  Race({
    required this.season,
    required this.round,
    required this.url,
    required this.raceName,
    required this.circuit,
    required this.date,
    required this.time,
    required this.firstPractice,
    required this.secondPractice,
    this.thirdPractice,
    required this.qualifying,
    this.sprint,
  });

  String season;
  String round;
  String url;
  String raceName;
  Circuit circuit;
  DateTime date;
  String time;
  FirstPractice firstPractice;
  FirstPractice secondPractice;
  FirstPractice? thirdPractice;
  FirstPractice qualifying;
  FirstPractice? sprint;

  factory Race.fromJson(String str) => Race.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Race.fromMap(Map<String, dynamic> json) => Race(
        season: json["season"],
        round: json["round"],
        url: json["url"],
        raceName: json["raceName"],
        circuit: Circuit.fromMap(json["Circuit"]),
        date: DateTime.parse(json["date"]),
        time: json["time"],
        firstPractice: FirstPractice.fromMap(json["FirstPractice"]),
        secondPractice: FirstPractice.fromMap(json["SecondPractice"]),
        thirdPractice: json["ThirdPractice"] == null
            ? null
            : FirstPractice.fromMap(json["ThirdPractice"]),
        qualifying: FirstPractice.fromMap(json["Qualifying"]),
        sprint: json["Sprint"] == null
            ? null
            : FirstPractice.fromMap(json["Sprint"]),
      );

  Map<String, dynamic> toMap() => {
        "season": season,
        "round": round,
        "url": url,
        "raceName": raceName,
        "Circuit": circuit.toMap(),
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "FirstPractice": firstPractice.toMap(),
        "SecondPractice": secondPractice.toMap(),
        "ThirdPractice": thirdPractice?.toMap(),
        "Qualifying": qualifying.toMap(),
        "Sprint": sprint?.toMap(),
      };
}

class Circuit {
  Circuit({
    required this.circuitId,
    required this.url,
    required this.circuitName,
    required this.location,
  });

  String circuitId;
  String url;
  String circuitName;
  Location location;

  factory Circuit.fromJson(String str) => Circuit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Circuit.fromMap(Map<String, dynamic> json) => Circuit(
        circuitId: json["circuitId"],
        url: json["url"],
        circuitName: json["circuitName"],
        location: Location.fromMap(json["Location"]),
      );

  Map<String, dynamic> toMap() => {
        "circuitId": circuitId,
        "url": url,
        "circuitName": circuitName,
        "Location": location.toMap(),
      };
}

class Location {
  Location({
    required this.lat,
    required this.long,
    required this.locality,
    required this.country,
  });

  String lat;
  String long;
  String locality;
  String country;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        lat: json["lat"],
        long: json["long"],
        locality: json["locality"],
        country: json["country"],
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "long": long,
        "locality": locality,
        "country": country,
      };
}

class FirstPractice {
  FirstPractice({
    required this.date,
    required this.time,
  });

  DateTime date;
  String time;

  factory FirstPractice.fromJson(String str) =>
      FirstPractice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FirstPractice.fromMap(Map<String, dynamic> json) => FirstPractice(
        date: DateTime.parse(json["date"]),
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
      };
}
