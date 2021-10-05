
import 'dart:convert';
import 'package:classroom_manager/services/apis.dart';
import 'package:classroom_manager/services/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'regcomplete.dart';

class Registration extends StatefulWidget {

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController studentcontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();

  FocusNode myNode = FocusNode();
  FocusNode myNode2 = FocusNode();

  final _formKey = GlobalKey<FormState>();

  _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }
bool validate = false;
bool circular = false;
String? listvalue;
String? listvalue2;
String? selectedid;
String? selectedid2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
          title: Text("Register", style: TextStyle(color: Colors.black)),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 20),
                        child: FittedBox(
                          child: Hero(
                            tag: 'reg',
                            child: SvgPicture.asset(
                              "assets/images/register.svg",
                              fit: BoxFit.contain,
                              height: 150,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Register New Students",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 30,),
                      Consumer<RoomProvider>(
                        builder: (context, data,child) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.green),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                validator: (value) => value == null ? 'field required' : null,
                                  icon: Icon(CupertinoIcons.chevron_down),
                                  isExpanded: true,
                                  value: listvalue,
                                  hint: Text("Select Student"),
                                  items:data.studentslist?.students?.map((item) {
                                    return DropdownMenuItem(
                                      onTap: (){
                                        setState(() {
                                          selectedid = item.id.toString();
                                          debugPrint(item.id.toString());
                                        });
                                      },
                                      child: Text(item.name.toString()),
                                      value: item.name.toString(),);}).toList(),
                                  onChanged: (listvalue) =>
                                      setState(() { 
                                        debugPrint(listvalue.toString());
                                        this.listvalue = listvalue.toString();
                                        })),
                            ),
                          );
                        }
                      ),
                      SizedBox(height: 20,),
                      Consumer<RoomProvider>(
                        builder: (context, data,child) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.green),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  icon: Icon(CupertinoIcons.chevron_down),
                                  isExpanded: true,
                                  value: listvalue2,
                                  hint: Text("Select Subject"),
                                  items:data.subjectslist?.subjects?.map((item) {
                                    return DropdownMenuItem(
                                      onTap: (){
                                        setState(() {
                                          selectedid2 = item.id.toString();
                                          debugPrint(item.id.toString());
                                        });
                                      },
                                      child: Text(item.name.toString()),
                                      value: item.name.toString(),);}).toList(),
                                  onChanged: (listvalue2) =>
                                      setState(() { 
                                        debugPrint(listvalue.toString());
                                        this.listvalue2 = listvalue2.toString();
                                        })),
                            ),
                          );
                        }
                      ),
                      SizedBox(height: 15,),
                      CupertinoButton(
                        color: CupertinoColors.activeGreen,
                        child: Text("Assign"), 
                      onPressed: ()async{
                        Map<String, String> body = {
                            "student": selectedid.toString(),
                            "subject": selectedid2.toString(),
                          };
                        _submit();
                        var response = await postRegData(body);
                        if (response.statusCode == 200) {
                            setState(() {
                              validate =true;
                              circular =false;
                            });
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  settings: RouteSettings(),
                                  builder: (context) =>Completed(),
                                ),
                                (route) => false);
                          } else {
                            Map<String, dynamic> output =
                                json.decode(response.body);
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
                                    Text(output["error"]),
                                  ],
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                            setState(() {
                              validate = false;
                             circular = true;
                            });
                          }
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
