// To parse this JSON data, do
//
//     final suggestion = suggestionFromJson(jsonString);

import 'dart:convert';

List<Suggestion> suggestionFromJson(String str) =>
    List<Suggestion>.from(json.decode(str).map((x) => Suggestion.fromJson(x)));

String suggestionToJson(List<Suggestion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Suggestion {
  Suggestion({
    this.isDisplay,
    this.id,
    this.section,
    this.group,
    this.feedback,
    this.v,
  });

  String isDisplay;
  String id;
  String section;
  String group;
  String feedback;
  int v;

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        isDisplay: json["isDisplay"],
        id: json["_id"],
        section: json["section"],
        group: json["group"],
        feedback: json["feedback"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "isDisplay": isDisplay,
        "_id": id,
        "section": section,
        "group": group,
        "feedback": feedback,
        "__v": v,
      };
}
