// ignore_for_file: prefer_const_constructors

import 'package:classroom_manager/screens/classroom/classroomlist.dart';
import 'package:classroom_manager/screens/registration/registrationlist.dart';
import 'package:classroom_manager/screens/students/studentslist.dart';
import 'package:classroom_manager/screens/subjects/subjectslist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';


class GridSection extends StatelessWidget {
  const GridSection({Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
           //=>> STUDENTS <===
            Flexible(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentsList()));
                },
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        HexColor("#83c6f1"),
                        HexColor("#7ea4f3")
                      ])),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Expanded(child: Hero(
                              tag: 'student',
                              child: SvgPicture.asset("assets/images/student.svg",fit: BoxFit.contain,))),
                          SizedBox(height:5),
                          Container(
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text("Students")),
                          )
                          ],
                        ),
                      ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            //==> SUBJECTS <====================================
            Flexible(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectList()));
                },
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        HexColor("#cc7af3"),
                        HexColor("#987ff4")
                      ])),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Expanded(child: Hero(
                              tag: 'subjects',
                              child: SvgPicture.asset("assets/images/subjects.svg",fit: BoxFit.contain,))),
                          SizedBox(height:5),
                          Container(
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text("Subjects")),
                          )
                          ],
                        ),
                      ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
      height: 10,
    ),
    Row(
      children: [
        Flexible(
          child: GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ClassroomList()));
            },
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: HexColor("#b8c8e2")),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    HexColor("#e2edf4"),
                    HexColor("#b8c8e2"),
                  ])),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Expanded(child: Hero(
                          tag: 'class',
                          child: SvgPicture.asset("assets/images/classrooms.svg",fit: BoxFit.contain,))),
                      SizedBox(height:5),
                      Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(child: Text("Classrooms")),
                      )
                      ],
                    ),
                  ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationList()));
            },
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    HexColor("#AAFFA9"),
                    HexColor("#11FFBD")
                  ])),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Expanded(child: Hero(
                          tag: 'register',
                          child: SvgPicture.asset("assets/images/reglist.svg",fit: BoxFit.contain,))),
                      SizedBox(height:5),
                      Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(child: Text("Registrations")),
                      )
                      ],
                    ),
                  ),
            ),
          ),
        )
      ],
    ),
      ],
    );
  }
}
