// To parse this JSON data, do
//
//     final studentsModel = studentsModelFromJson(jsonString);

import 'dart:convert';

StudentsModel studentsModelFromJson(String str) => StudentsModel.fromJson(json.decode(str));

String studentsModelToJson(StudentsModel data) => json.encode(data.toJson());

class StudentsModel {
    StudentsModel({
        this.students,
    });

    List<Student>? students;

    factory StudentsModel.fromJson(Map<String, dynamic> json) => StudentsModel(
        students: json["students"] == null ? null : List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "students": students == null ? null : List<dynamic>.from(students!.map((x) => x.toJson())),
    };
}

class Student {
    Student({
        this.age,
        this.email,
        this.id,
        this.name,
    });

    int? age;
    String? email;
    int? id;
    String? name;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        age: json["age"] == 0 ? "N/A" : json["age"],
        email: json["email"] == "" ? "N/A" : json["email"],
        id: json["id"] == 0 ? "N/A" : json["id"],
        name: json["name"] == "" ? "N/A" : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "age": age == 0 ? "N/A" : age,
        "email": email == "" ? "N/A" : email,
        "id": id == 0 ? "N/A" : id,
        "name": name == "" ? "N/A" : name,
    };
}
