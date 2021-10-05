
import 'package:classroom_manager/services/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class SubjectList extends StatelessWidget {
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
        title: Text("Subjects",style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:15),
            child: Column(
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [HexColor("#cc7af3"), HexColor("#987ff4")])),
                  child: Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Hero(
                              tag: 'subjects',
                              child: SvgPicture.asset(
                                                      "assets/images/subjects.svg",
                                                      fit: BoxFit.contain,
                                                    ),
                            )),
                        SizedBox(height: 5),
                        Expanded(
                          child: Text("Subjects",style: TextStyle(color: Colors.white,fontSize:20,fontWeight:FontWeight.bold),)
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
                      itemCount: data.subjectslist?.subjects?.length,
                      itemBuilder: (context, index) {
                        final datalist = data.subjectslist?.subjects?[index];
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: CupertinoColors.extraLightBackgroundGray
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Subject',),
                                    SizedBox(height: 5,),
                                    FittedBox(
                                      child: Text('${datalist?.name}',
                                      style: TextStyle(fontWeight: FontWeight.w600)),
                                    ),
                                    
                                    ]
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Teacher',),
                                    SizedBox(height: 5,),
                                    FittedBox(
                                      child: Text('${datalist?.teacher}',
                                      style: TextStyle(fontWeight: FontWeight.w600)),
                                    ),
                                    
                                    ]
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Credits',),
                                    SizedBox(height: 5,),
                                    FittedBox(
                                      child: Text('${datalist?.credits}',
                                      style: TextStyle(fontWeight: FontWeight.w600)),
                                    ),
                                    
                                    ]
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
