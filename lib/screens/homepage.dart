import 'package:classroom_manager/services/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/gridsection.dart';
import 'widgets/registerbanner.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<RoomProvider>(context,listen: false).getData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final status= Provider.of<RoomProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: 
          status.loading == true ? Center(child: CupertinoActivityIndicator()):
          SingleChildScrollView(
            child: Column(
              children: [
                ClassroomManagerHeading(),
                RegisterBanner(),//This is registration banner
                ManageText(),
                GridSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClassroomManagerHeading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text("Classroom Manager",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class ManageText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text("Manage",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

