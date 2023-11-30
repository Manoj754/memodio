// To parse this JSON data, do
//
//     final childData = childDataFromJson(jsonString);

import 'dart:convert';

ChildData childDataFromJson(String str) => ChildData.fromJson(json.decode(str));

String childDataToJson(ChildData data) => json.encode(data.toJson());

class ChildData {
    String name;
    String country;
    String status;

    ChildData({
        required this.name,
        required this.country,
        required this.status,
    });

    factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
        name: json["name"],
        country: json["country"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "country": country,
        "status": status,
    };
}
