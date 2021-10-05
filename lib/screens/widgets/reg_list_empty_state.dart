
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
            SizedBox(height: 20,),
            Text("Nothing...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            CupertinoButton(
              color: CupertinoColors.activeGreen,
              child: Text("Go Back"), onPressed: (){
              Navigator.pop(context);
            })
          ],
        ),),
    );
  }
}