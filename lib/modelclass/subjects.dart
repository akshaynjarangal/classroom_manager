// To parse this JSON data, do
//
//     final subjectsModel = subjectsModelFromJson(jsonString);

import 'dart:convert';

SubjectsModel subjectsModelFromJson(String str) => SubjectsModel.fromJson(json.decode(str));

String subjectsModelToJson(SubjectsModel data) => json.encode(data.toJson());

class SubjectsModel {
    SubjectsModel({
        this.subjects,
    });

    List<Subject>? subjects;

    factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
        subjects: json["subjects"] == null ? null : List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subjects": subjects == null ? null : List<dynamic>.from(subjects!.map((x) => x.toJson())),
    };
}

class Subject {
    Subject({
        this.credits,
        this.id,
        this.name,
        this.teacher,
    });

    int? credits;
    int? id;
    String? name;
    String? teacher;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        credits: json["credits"] == 0 ? 0 : json["credits"],
        id: json["id"] == 0 ? "N/A" : json["id"],
        name: json["name"] ==""?"N/A" : json["name"],
        teacher: json["teacher"] == "" ? "N/A" : json["teacher"],
    );

    Map<String, dynamic> toJson() => {
        "credits": credits == 0 ? 0 : credits,
        "id": id == 0?"N/A" : id,
        "name": name == "" ? "N/A" : name,
        "teacher": teacher == "" ? "N/A" : teacher,
    };
}
