import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:classroom_manager/constants/constants.dart';
import 'package:classroom_manager/modelclass/class_detail.dart';
import 'package:classroom_manager/modelclass/classroom.dart';
import 'package:classroom_manager/modelclass/registrations.dart';
import 'package:classroom_manager/modelclass/students.dart';
import 'package:classroom_manager/modelclass/subjects.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//Registration POST Method
Future<Response> postRegData(Map<String, String>body) async {
  final url = Uri.https(baseurl,endpoint1,params);
  final response = await http.post(
    url,
    headers: {
      HttpHeaders.contentTypeHeader:"application/x-www-form-urlencoded"},
    body: body);
  return response;
}
//GET Registration details

Future<RegistrationsModel?> getRegDetails(context) async {
    try {
    final server = Uri.https(baseurl,endpoint1,params);
    final response = await http.get(server);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      
      return RegistrationsModel.fromJson(item);
    }
    else {
      print(response.statusCode);
    }
    }catch (error) {
      print(error);
    }
    
}


//GET Classroom details 
Future<ClassRoomModel?> getClassroomData(context) async {
  try {
    final server = Uri.https(baseurl,endpoint2,params);
    final response = await http.get(server);
    if (response.statusCode == 200) {
      var item = json.decode(response.body);
      return ClassRoomModel.fromJson(item);
    } 
    else {
      print(response.statusCode);
    }
  }
    catch (error){
      print(error);
    }
    
}

Future<ClassDetailModel?> getClassDataById(context,String id) async {
  try {
    final server = Uri.https(baseurl,endpoint2+id,params);
    final url = Uri.parse("$server");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      var item = json.decode(response.body);
      return ClassDetailModel.fromJson(item);
    } 
    else {
      print(response.statusCode);
    }
  }
    catch (error){
      print(error);
    }
    
}


//GET Subject details
Future<SubjectsModel?> getSubjectData(context) async {
  try {
    final server = Uri.https(baseurl,endpoint3,params);
    final response = await http.get(server);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      return SubjectsModel.fromJson(item);
    } 
    else{
      print(response.statusCode);
    }
  }catch (error) {
    print(error);
  }
}

//GET Students details

Future<StudentsModel?> getStudentData(context) async {
  try{
    final server = Uri.https(baseurl,endpoint4,params);
    final response = await http.get(server);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      return StudentsModel.fromJson(item);
    }
    else {
      print(response.statusCode);
    }
  } 
    catch (error) {
      print(error);
    }
}


Future<String?> deleteRegister(String? id) async {
  try {
    final server = Uri.https(baseurl,endpoint1+id!,params);
    final response = await http.delete(server);
    if (response.statusCode == 200) {
    } 
    else {
      print(response.statusCode);
    }
  } catch (error) {
    print(error);
  }
}

//Class Subject PATCH Method
Future<Response> patchSubject(Map<String, String>body,String? id) async {
  final url = Uri.https(baseurl,endpoint2+id!,params);
  final response = await http.patch(
    url,
    headers: {
      HttpHeaders.contentTypeHeader:"application/x-www-form-urlencoded"},
    body: body);
  return response;
}
