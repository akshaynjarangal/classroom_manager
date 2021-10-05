// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:classroom_manager/services/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ClassRoomDetail extends StatefulWidget {
  final String? title;

  const ClassRoomDetail({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<ClassRoomDetail> createState() => _ClassRoomDetailState();
}

class _ClassRoomDetailState extends State<ClassRoomDetail> {
  final _formKey = GlobalKey<FormState>();

  get index => Provider.of<RoomProvider>(context).classdetail?.subject;

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
  String? selectedid;
  @override
  @override
  Widget build(BuildContext context) {
    RoomProvider status = Provider.of<RoomProvider>(context);
     return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: Text(widget.title.toString(),
            style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: status.loading2 == true
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: CupertinoActivityIndicator()),
            )
          : Consumer<RoomProvider>(builder: (context, data, child) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              HexColor("#83c6f1"),
                              HexColor("#7ea4f3")
                            ])),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(TextSpan(
                                  text: 'Name : ',
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                        text: '${data.classdetail?.name}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))
                                  ])),
                              SizedBox(
                                height: 15,
                              ),
                              Text.rich(TextSpan(
                                  text: 'Class Strength : ',
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                        text: '${data.classdetail?.size}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))
                                  ])),
                              SizedBox(
                                height: 15,
                              ),
                              data.loading2==true?CupertinoActivityIndicator(): Text.rich(TextSpan(
                                  text: 'Subject : ',
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                        text: data.classdetail?.subject==null?"N/A": data.subjectslist
                                            ?.subjects?[index! - 1].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700))
                                  ])),
                              SizedBox(
                                height: 15,
                              ),
                              Visibility(
                                visible: data.classdetail?.subject == ""
                                    ? false
                                    : true,
                                child: Column(
                                  children: [
                                    Consumer<RoomProvider>(
                                        builder: (context, data, child) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.white),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                              ),
                                              validator: (value) =>
                                                  value == null
                                                      ? 'field required'
                                                      : null,
                                              icon: Icon(
                                                  CupertinoIcons.chevron_down),
                                              isExpanded: true,
                                              value: listvalue,
                                              hint: Text(
                                                "Select Subject",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              items: data.subjectslist?.subjects
                                                  ?.map((item) {
                                                return DropdownMenuItem(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedid =
                                                          item.id.toString();
                                                      debugPrint(
                                                          item.id.toString());
                                                    });
                                                  },
                                                  child: Text(
                                                      item.name.toString()),
                                                  value: item.name.toString(),
                                                );
                                              }).toList(),
                                              onChanged: (listvalue) =>
                                                  setState(() {
                                                    debugPrint(
                                                        listvalue.toString());
                                                    this.listvalue =
                                                        listvalue.toString();
                                                  })),
                                        ),
                                      );
                                    }),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CupertinoButton(
                                        color: CupertinoColors.white,
                                        child: Text("Update Subject",
                                            style:
                                                TextStyle(color: Colors.green)),
                                        onPressed: () async {
                                          Map<String, String> body = {
                                            "subject": selectedid.toString(),
                                          };
                                          _submit();
                                          var response =
                                              await data.updateSubject(body,data.classdetail?.id.toString());
                                          if (response.statusCode == 200) {
                                            setState(() {
                                              validate = true;
                                              circular = false;
                                            });
                                            data.getDataById(context, data.classdetail?.id.toString());
                                          } else {
                                            // Map<String, dynamic> output =
                                            //     json.decode(response.body);
                                            final snackbar = SnackBar(
                                                backgroundColor:
                                                    Colors.red[400],
                                                elevation: 10,
                                                behavior:
                                                    SnackBarBehavior.floating,
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
                                                    Text("error"),
                                                  ],
                                                ));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackbar);
                                            setState(() {
                                              validate = false;
                                              circular = true;
                                            });
                                          }
                                        })
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
    );
  }
}

