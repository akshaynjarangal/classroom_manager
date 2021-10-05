// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:classroom_manager/services/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class StudentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,)),
        title: Text("Students",style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15),
            child: Column(
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [HexColor("#83c6f1"),
                              HexColor("#7ea4f3")])),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Hero(
                              tag: 'student',
                              child: SvgPicture.asset(
                                                      "assets/images/student.svg",
                                                      fit: BoxFit.contain,
                                                    ),
                            )),
                        SizedBox(height: 5),
                        Expanded(
                          child: Text("Students",style: TextStyle(color: Colors.white,fontSize:20,fontWeight:FontWeight.bold),)
                        )
                      ],
                    ),
                  ),
                ),
                Consumer<RoomProvider>(builder: (context, data, child) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.studentslist?.students?.length,
                      itemBuilder: (context, index) {
                        final datalist = data.studentslist?.students?[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: CupertinoColors.extraLightBackgroundGray
                            ),
                            child: Row(
                              children: [
                                Text("${index+1}",style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:const [
                                    Text('Name',),
                                    Text('Email',),
                                    Text('Age',),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                          child: Text('${datalist?.name}',
                                          style: TextStyle(fontWeight: FontWeight.w600)),
                                        ),
                                    FittedBox(
                                          child: Text('${datalist?.email}',
                                          style: TextStyle(fontWeight: FontWeight.w600)),
                                        ),
                                    FittedBox(
                                          child: Text('${datalist?.age}',
                                          style: TextStyle(fontWeight: FontWeight.w600)),
                                        ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
