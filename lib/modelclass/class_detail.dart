// To parse this JSON data, do
//
//     final classDetailModel = classDetailModelFromJson(jsonString);


import 'dart:convert';

ClassDetailModel classDetailModelFromJson(String str) => ClassDetailModel.fromJson(json.decode(str));

String classDetailModelToJson(ClassDetailModel data) => json.encode(data.toJson());

class ClassDetailModel {
    ClassDetailModel({
        this.id,
        this.layout,
        this.name,
        this.size,
        this.subject,
    });

    int? id;
    String? layout;
    String? name;
    int? size;
    dynamic subject;

    factory ClassDetailModel.fromJson(Map<String, dynamic> json) => ClassDetailModel(
        id: json["id"] == 0 ? null : json["id"],
        layout: json["layout"] == "" ? null : json["layout"],
        name: json["name"] == "" ? null : json["name"],
        size: json["size"] == "" ? null : json["size"],
        subject: json["subject"] == "" ? null : json["subject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == 0 ? null : id,
        "layout": layout == "" ? null : layout,
        "name": name == "" ? null : name,
        "size": size == 0 ? 0 : size,
        "subject": subject == "" ? null : subject,
    };
}
