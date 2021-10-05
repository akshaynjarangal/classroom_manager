import 'dart:async';
import 'package:classroom_manager/modelclass/class_detail.dart';
import 'package:classroom_manager/modelclass/classroom.dart';
import 'package:classroom_manager/modelclass/registrations.dart';
import 'package:classroom_manager/modelclass/students.dart';
import 'package:classroom_manager/modelclass/subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'apis.dart';
class RoomProvider with ChangeNotifier{
SubjectsModel? subjectslist = SubjectsModel();
StudentsModel? studentslist = StudentsModel();
ClassRoomModel? classroomlist = ClassRoomModel();
RegistrationsModel? registrationslist = RegistrationsModel();
List<Subject>? subjects;

bool? loading = false;
bool? loading2 = false;
bool? loading3 = false;
List<Student>? stdlist;
ClassDetailModel? classdetail = ClassDetailModel();
Future<void> getData(context) async {
    loading = true;
    // GET subjects details
    subjectslist = await getSubjectData(context);
    //GET Students details
    studentslist = await getStudentData(context);
    //GET Classroom details
    classroomlist = await getClassroomData(context);
    //GET Registrations details
    registrationslist = await getRegDetails(context);
    loading=false;
    notifyListeners();
  }
  Future<String?> removeRegister(String? id)async {
    loading3= true;
    return deleteRegister(id!);
  }
  Future<void> getDataById(context,String? id) async {
    loading2 = true;
    classdetail = await getClassDataById(context, id!);
    loading2 =false;
    notifyListeners();
  }
  Future<Response> updateSubject(Map<String,String> body,String? id) async {
    loading =true;
    return patchSubject(body, id!);
  }
}

