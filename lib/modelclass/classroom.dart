// To parse this JSON data, do
//
//     final classRoomModel = classRoomModelFromJson(jsonString);

import 'dart:convert';

ClassRoomModel classRoomModelFromJson(String str) => ClassRoomModel.fromJson(json.decode(str));

String classRoomModelToJson(ClassRoomModel data) => json.encode(data.toJson());

class ClassRoomModel {
    ClassRoomModel({
        this.classrooms,
    });

    List<Classroom>? classrooms;

    factory ClassRoomModel.fromJson(Map<String, dynamic> json) => ClassRoomModel(
        classrooms: json["classrooms"] == null ? null : List<Classroom>.from(json["classrooms"].map((x) => Classroom.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "classrooms": classrooms == null ? null : List<dynamic>.from(classrooms!.map((x) => x.toJson())),
    };
}

class Classroom {
    Classroom({
        this.id,
        this.layout,
        this.name,
        this.size,
        
    });

    int? id;
    String? layout;
    String? name;
    int? size;

    factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"] == 0 ? "N/A" : json["id"],
        layout: json["layout"] == "" ? "N/A" : json["layout"],
        name: json["name"] == "" ? "N/A" : json["name"],
        size: json["size"] == "" ? "N/A" : json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == 0 ? "N/A" : id,
        "layout": layout == "" ? "N/A" : layout,
        "name": name == "" ? "N/A" : name,
        "size": size == 0 ? 0 : size,
    };
}
