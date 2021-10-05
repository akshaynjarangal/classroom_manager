import 'package:classroom_manager/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Completed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/completed.svg",height: 200,width: 200,fit: BoxFit.contain,),
             SizedBox(height: 20,),
             Text("Completed",style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,letterSpacing: 1)),
             SizedBox(height: 20,),
            CupertinoButton(
              color: CupertinoColors.activeGreen,
              child: Text("Go to Home"), onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            })
          ],
        ),
      ),
      
    );
  }
}