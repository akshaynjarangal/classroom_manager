

import 'package:classroom_manager/services/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'classroom_details.dart';

class ClassroomList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child:Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: Text("Classroom", style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [HexColor("#83c6f1"), HexColor("#7ea4f3")])),
                  child: Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Hero(
                          tag: 'class',
                          child: SvgPicture.asset(
                            "assets/images/classrooms.svg",
                            fit: BoxFit.contain,
                          ),
                        )),
                        SizedBox(width: 10),
                        Expanded(
                            child: Text(
                          "Classrooms",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                  ),
                ),
                Consumer<RoomProvider>(builder: (context, data, child) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.classroomlist?.classrooms?.length,
                      itemBuilder: (context, index) {
                        final datalist = data.classroomlist?.classrooms;
                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: GestureDetector(
                              onTap: (){
                              Provider.of<RoomProvider>(context,listen: false).getDataById(context,datalist?[index].id.toString());
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClassRoomDetail(title: datalist?[index].name,)));
                              },
                              child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: CupertinoColors
                                          .extraLightBackgroundGray),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${datalist?[index].name}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16)),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.black,
                                        )
                                      ])),
                            ));
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