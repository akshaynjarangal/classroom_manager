import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../registration.dart';

class RegisterBanner extends StatelessWidget {
  const RegisterBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 125,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: HexColor("#76eccc").withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          gradient:const LinearGradient(colors:[
            Colors.greenAccent,
            Colors.lightBlueAccent
          ]),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'reg',
                child: SvgPicture.asset(
                  "assets/images/register.svg",
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            Positioned(
                top: 30,
                bottom: 0,
                left: 80,
                right: 0,
                child: Column(
                  children: [
                    const Text(
                      "Register New Students",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoButton(
                        padding:const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        color: CupertinoColors.white,
                        child: Text("Register",
                            style:
                                TextStyle(color: Colors.green[300])),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>const Registration()));
                        })
                  ],
                ))
          ],
        ));
  }
}
