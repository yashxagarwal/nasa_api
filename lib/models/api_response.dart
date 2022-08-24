// To parse this JSON data, do
//
//     final apimodel = apimodelFromJson(jsonString);

import 'dart:convert';

Apimodel apimodelFromJson(String str) => Apimodel.fromJson(json.decode(str));

String apimodelToJson(Apimodel data) => json.encode(data.toJson());

class Apimodel {
    Apimodel({
        required this.date,
        required this.explanation,
        required this.mediaType,
        required this.serviceVersion,
       required  this.title,
       required  this.url,
    });

    DateTime date;
    String explanation;
    String mediaType;
    String serviceVersion;
    String title;
    String url;

    factory Apimodel.fromJson(Map<String, dynamic> json) => Apimodel(
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "explanation": explanation,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
    };
}
