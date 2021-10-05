// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset("assets/images/empty.svg",height: 200,width: 200,fit: BoxFit.contain,),
            ),
            const SizedBox(height: 20,),
            const Text("Nothing...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            CupertinoButton(
              color: CupertinoColors.activeGreen,
              child: const Text("Go Back"), onPressed: (){
              Navigator.pop(context);
            })
          ],
        ),),
    );
  }
}