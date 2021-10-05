// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:classroom_manager/screens/reg_list_empty_state.dart';
import 'package:classroom_manager/services/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class RegistrationList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final regdata = Provider.of<RoomProvider>(context);
    Widget home = Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,)),
        title: const Text("Registration",style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          Container(
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [HexColor("#AAFFA9"),
                                HexColor("#11FFBD")])),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Hero(
                                tag: 'register',
                                child: SvgPicture.asset(
                                                        "assets/images/reglist.svg",
                                                        fit: BoxFit.contain,
                                                      ),
                              )),
                          const SizedBox(height: 5),
                          const Expanded(
                            child: Text("Registrations",style: TextStyle(color: Colors.white,fontSize:20,fontWeight:FontWeight.bold),)
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  regdata.loading==true?Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CupertinoActivityIndicator(),
                  ): Consumer<RoomProvider>(
                    builder: (context, data,child) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.registrationslist?.registrations?.length,
                          itemBuilder: (context, index) {
                           final number = data.registrationslist?.registrations;

                            //final datalist = data.studentslist?.students?[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: CupertinoColors.extraLightBackgroundGray
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("${index+1}",style: const TextStyle(fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 15,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children:const[
                                            Text('Student ',),
                                            SizedBox(height: 15,),
                                            Text('Subject',),
                                            
                                          ],
                                        ),
                                        const SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            FittedBox(
                                                  child: Text('${data.studentslist?.students?[number![index].student!-1].name}',
                                                  style: const TextStyle(fontWeight: FontWeight.w600)),
                                                ),
                                            const SizedBox(height:15),
                                            FittedBox(
                                                  child: Text('${data.subjectslist?.subjects?[number![index].subject!-1].name}',
                                                  style: const TextStyle(fontWeight: FontWeight.w600)),
                                                ),
                                            
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children:[
                                        GestureDetector(
                                          onTap: (){
                                            data.removeRegister(number![index].id.toString()).then((value) => data.getData(context));
                                            if(data.loading3==true){
                                              final snackbar = SnackBar(
                                backgroundColor: Colors.red[400],
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(10),
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Deleteting ${data.studentslist?.students?[number[index].student!-1].name}"),
                                  ],
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                            }
                                            else {
                                              data.getData(context);
                                            }
                                          },
                                          child: const Icon(CupertinoIcons.delete)),
                                        
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  )
        ],),
      ),
    );
    switch(regdata.registrationslist?.registrations?.isEmpty){
      case false: 
      return home;
      case true: 
      return EmptyState();
      default: return home;
    }
  }
}