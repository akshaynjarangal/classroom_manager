// To parse this JSON data, do
//
//     final registrationsModel = registrationsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

RegistrationsModel registrationsModelFromJson(String str) => RegistrationsModel.fromJson(json.decode(str));

String registrationsModelToJson(RegistrationsModel data) => json.encode(data.toJson());

class RegistrationsModel {
    RegistrationsModel({
        this.registrations,
    });

    List<Registration>? registrations;

    factory RegistrationsModel.fromJson(Map<String, dynamic> json) => RegistrationsModel(
        registrations: json["registrations"] == null ? null : List<Registration>.from(json["registrations"].map((x) => Registration.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "registrations": registrations == null ? null : List<dynamic>.from(registrations!.map((x) => x.toJson())),
    };
}

class Registration {
    Registration({
        this.id,
        this.student,
        this.subject,
    });

    int? id;
    int? student;
    int? subject;

    factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        id: json["id"] == null ? null : json["id"],
        student: json["student"] == null ? null : json["student"],
        subject: json["subject"] == null ? null : json["subject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "student": student == null ? null : student,
        "subject": subject == null ? null : subject,
    };
}
